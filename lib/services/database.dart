import 'dart:convert';
import 'package:alpha/services/globals.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:alpha/models/listing.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
// ignore: unused_import
import 'package:uuid/uuid.dart';

String databaseName = 'database.db';
Database db;

final String tableListings = 'listings';
final String columnUUID = 'uuid';
final String columnName = 'name';
final String columnDescription = 'description';
final String columnPrice = 'price';
final String columnSellerDetails = 'seller_details';
final String columnMobileNumber = 'mobile_number';
final String columnWhatsAppNumber = 'whatsapp_number';
final String columnLocation = 'location';
final String columnPriority = 'priority';
final String columnCategory = 'category';
final String columnWhatsAppBusinessLink = "whatsapp_business_link";
final String columnIsHot = 'is_hot';
final String columnIsFavourite = 'is_favourite';
final String columnCreatedAt = 'created_at';

Future openOrCreateDatabase() async {
  String databasePath = await getDatabasesPath();
  databasePath = databasePath + databaseName;

  // await deleteDatabase(databasePath);
  // print(DateTime.now().millisecondsSinceEpoch);

  db = await openDatabase(databasePath, version: 1,
      onCreate: (Database db, int version) async {
    await db.execute('''
        create table $tableListings ( 
			$columnUUID TEXT NOT NULL,
			$columnName TEXT NOT NULL,
			$columnDescription TEXT NOT NULL,
			$columnPrice TEXT NOT NULL,
			$columnSellerDetails TEXT NOT NULL,
      $columnMobileNumber TEXT NOT NULL,
      $columnCategory TEXT NOT NULL,
      $columnWhatsAppNumber TEXT,
      $columnWhatsAppBusinessLink TEXT,
			$columnLocation TEXT,
      $columnPriority INTEGER NOT NULL,
      $columnIsHot INTEGER NOT NULL,
      $columnIsFavourite INTEGER,

			$columnCreatedAt INTEGER NOT NULL)
        ''');

    // await db.insert(tableListings, {
    //   columnUUID: Uuid().v1(),
    //   columnName: "Acer Travel Mate p645",
    //   columnDescription:
    //       "A very good laptop, 3.5hr battery, 256GB SSD, 8GB DDR3 RAM",
    //   columnPrice: "400 USD",
    //   columnSellerDetails: "Rufaro Sithole",
    //   columnMobileNumber: "+263774671339",
    //   columnWhatsAppNumber: "+263774671339",
    //   columnLocation: "Harare",
    //   columnCategory: "Gadgets",
    //   columnWhatsAppBusinessLink: "",
    //   columnPriority: 10,
    //   columnIsHot: 1,
    //   columnCreatedAt: DateTime.now().millisecondsSinceEpoch,
    // });
  });
}

Future<void> populateDatabase(dataFromFile, BuildContext context) async {
  ListingProvider listingProvider =
      Provider.of<ListingProvider>(context, listen: false);
  // print(dataFromFile);
  //Encrypting data
  final key = encrypt.Key.fromUtf8(encryptionKey);
  final iv = encrypt.IV.fromLength(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  final String decryptedData = encrypter.decrypt64(dataFromFile, iv: iv);
  var data = json.decode(decryptedData);
  if (data.length > 0) {
    for (int i = 0; i < data.length; i++) {
      var record = data[i];
      Listing listing = Listing.fromMap(record);
      if (!listingProvider.listingsList
          .any((Listing lst) => lst.uuid == listing.uuid)) {
        await listingProvider.insert(listing);
      }
    }
  }
  return true;
}
