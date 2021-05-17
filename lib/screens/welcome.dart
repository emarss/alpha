import 'dart:async';

import 'package:alpha/services/colors.dart';
import 'package:alpha/services/core.dart';
import 'package:alpha/services/routes.dart';
import 'package:alpha/services/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WelcomeScreenState();
  }
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkDatabaseFileExist();
  }

  checkDatabaseFileExist() {
    Timer.periodic(new Duration(seconds: 5), (timer) async {
      await readDataFromDatabaseFiles(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final String whatsAppNumber = "+263774671339";
    final String welcomeMessage = "Express Market App Subscription request.";

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 8),
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0, bottom: 40.0),
                child: Icon(
                  Icons.touch_app,
                  size: 200,
                  color: greyColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  "Welcome!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Click the button below to subscribe to our WhatsApp platform and get the application data everyday.",
                style: greyNormalText,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  launch("https://wa.me/$whatsAppNumber?text=$welcomeMessage");
                },
                child: Text("Subscribe", style: whiteSemiBoldText),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 48)),
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    foregroundColor: MaterialStateProperty.all(whiteColor)),
              ),
              SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(HelpRoute);
                },
                child: Text("Help"),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 36)),
                    foregroundColor: MaterialStateProperty.all(primaryColor)),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
