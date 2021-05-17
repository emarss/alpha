import 'package:alpha/services/colors.dart';
import 'package:alpha/services/styles.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AboutScreenState();
  }
}

class AboutScreenState extends State<AboutScreen> {
  final String whatsAppNumber = "+263774671339";
  final String website = "https://emarss.co.zw";
  final String email = "info@emarss.co.zw";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: whiteColor),
          title: Text(
            "About",
            style: whiteNormalText,
          ),
          elevation: 1,
        ),
        body: ListView(
            padding: EdgeInsets.symmetric(vertical: 8),
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
                child: Icon(
                  Icons.shop_two,
                  size: 80,
                  color: whiteColor,
                ),
              ),
              Column(
                children: [
                  Text(
                    "Express Market",
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Version 1.0.0",
                    style: whiteNormalTextSmall,
                  )
                ],
              ),
              Divider(height: 30),
              ListTile(
                leading: Icon(
                  Icons.apps,
                  color: whiteColor,
                ),
                title: Text(
                  "Developer",
                  style: whiteNormalText,
                ),
                subtitle: Text(
                  'Emarss Technologies',
                  style: whiteNormalTextSmall,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.email,
                  color: whiteColor,
                ),
                title: Text(
                  "Email Address",
                  style: whiteNormalText,
                ),
                subtitle: Text(
                  'info@emarss.co.zw',
                  style: whiteNormalTextSmall,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.launch, color: whiteColor),
                  onPressed: () {
                    launch("mailto:$email");
                  },
                ),
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.internetExplorer,
                  color: whiteColor,
                ),
                title: Text(
                  "Website",
                  style: whiteNormalText,
                ),
                subtitle: Text(
                  'https://emarss.co.zw',
                  style: whiteNormalTextSmall,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.launch, color: whiteColor),
                  onPressed: () {
                    launch("$website");
                  },
                ),
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: whiteColor,
                ),
                title: Text(
                  "WhatsApp Number",
                  style: whiteNormalText,
                ),
                subtitle: Text(
                  '+263 77 467 1339',
                  style: whiteNormalTextSmall,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.launch, color: whiteColor),
                  onPressed: () {
                    launch("https://wa.me/$whatsAppNumber");
                  },
                ),
              ),
              Divider(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "More About Us",
                      style: whiteSemiBoldTexth2,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Emarss Technologies is a Software Company in Zimbabwe, specializing in website development, mobile app development and other custom software solutions.",
                      style: whiteNormalText,
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
