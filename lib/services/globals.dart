import 'package:alpha/services/colors.dart';
import 'package:alpha/services/styles.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

String getAppInfo =
    "Get the Express Market app - an app that allows your to buy, sell or get anything much faster in Zimbabwe, without the internet, just using your WhatsApp. Get the app via WhatsApp by clicking the link https://wa.me/+263774671339?text=Express%20Market%20App. \n\nThe app is brought to you by Emarss Technologies and Express Trade Marketing Company.";

showMessageBox(BuildContext context, String message,
    {String title = "Alert"}) async {
  await Alert(
    context: context,
    style: rAlertStyleNotDismissible,
    type: AlertType.info,
    title: title,
    desc: message,
    buttons: [
      DialogButton(
        child: Text(
          "Close",
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w800),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        color: lightGreyColor,
        height: 45,
      ),
    ],
  ).show();
}

String encryptionKey = "CarterChechaEmarssRufaroUbuntu04";
