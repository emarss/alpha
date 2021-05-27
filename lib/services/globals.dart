import 'package:alpha/services/colors.dart';
import 'package:alpha/services/styles.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

String getAppInfo =
    "\n\n\nGet the Express Market app - an app that allows your to buy, sell or get anything much faster in Zimbabwe, without the internet, just using your WhatsApp. Download the app from https://expressmarket.co.zw or get it via WhatsApp by clicking the link https://wa.me/+263774671339?text=Express Market App. \n\nThe app is brought to you by Emarss Technologies and Express Trade Africa. \nExpress Trade Africa is a marketing company in Zimbabwe, specialising in company branding, marketing, reputation, human resource planning, financial planning and management, product development, strategic initiatives, project Management, and business planning. \nEmarss Technologies is a software company in Zimbabwe, specializing in website development, mobile app development and other custom software solutions.";

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
