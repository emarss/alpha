import 'dart:io';

import 'package:alpha/models/listing.dart';
import 'package:alpha/services/colors.dart';
import 'package:alpha/services/database.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

Future<bool> applicationStarter(BuildContext context) async {
  await openOrCreateDatabase();

  //fetching records before insertions from file to verify duplication
  await Provider.of<ListingProvider>(context, listen: false).getAllListings();
  await readDataFromDatabaseFiles(context);

  //deleting old records after insertions
  await Provider.of<ListingProvider>(context, listen: false)
      .deleteOldListings();
  return true;
}

Future<bool> readDataFromDatabaseFiles(BuildContext context) async {
  var status = await Permission.storage.status;
  if (status.isDenied) {
    status = await Permission.storage.request();
  }

  if (status.isDenied) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Alert"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      "The Express Market app cannot not work without the permission to read external storage. Please, grand the storage permissions."),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: Text('Grand Permission'),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(primaryColor)),
                        onPressed: () async {
                          // Navigator.of(context).pop();
                          await Permission.storage.request();
                        },
                      ),
                      TextButton(
                        child: Text('Close App'),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(redColor)),
                        onPressed: () {
                          exit(0);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ));
    return false;
  }

  for (var rootFolder in Directory("/storage/emulated/0/").listSync()) {
    if (rootFolder.path.contains("WhatsApp")) {
      for (var whatsAppFolder in Directory(rootFolder.path).listSync()) {
        if (whatsAppFolder.path.contains("Media")) {
          for (var mediaAppFolder
              in Directory(whatsAppFolder.path).listSync()) {
            if (mediaAppFolder.path.contains("Document")) {
              List<String> fileNames = getFileNames();
              for (var document in Directory(mediaAppFolder.path).listSync()) {
                if (document.path.endsWith(".emdf")) {
                  for (String fileName in fileNames) {
                    if (document.path.contains(fileName)) {
                      File file = File(document.path);
                      String contents = await file.readAsString();
                      await populateDatabase(contents, context);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return true;
}

List<String> getFileNames() {
  List<String> fileNames = [];
  int currentTimeStamp = DateTime.now().millisecondsSinceEpoch;
  for (int i = 0; i < 7; i++) {
    DateTime currentDay = DateTime.fromMillisecondsSinceEpoch(currentTimeStamp);
    String fileName = "database";
    fileName = fileName + "_" + currentDay.year.toString();
    fileName = fileName + "_" + currentDay.month.toString();
    fileName = fileName + "_" + currentDay.day.toString();
    fileNames.add(fileName);
    currentTimeStamp = currentTimeStamp - 24 * 60 * 60 * 1000;
  }

  return fileNames;
}
