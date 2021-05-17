import 'package:alpha/models/listing.dart';
import 'package:alpha/services/colors.dart';
import 'package:alpha/services/styles.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HelpScreenState();
  }
}

class HelpScreenState extends State<HelpScreen> {
  final String whatsAppNumber = "+263774671339";
  final String website = "https://expressmarket.co.zw";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Help"),
          elevation: 1,
        ),
        body: ListView(
            padding: EdgeInsets.all(12),
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              SizedBox(height: 8),
              if (Provider.of<ListingProvider>(context).listingsList.isEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "I keep seeing the welcome screen?",
                      style: greySemiBoldTexth2,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "The Welcome Screen is shown when you open the app for the first time. \n\nIf you are not opening the app for the first time and you keep seeing the Welcome Screen, this means that you have not yet received a database file from our team, even once. \n\nTo get the database file, read the section below. \n\nIf you have received the database file and you are still seeing the Welcome Screen, please, contact us by clicking the buttons near the bottom of this page.",
                      style: greyNormalText,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              Text(
                "How do I use the app?",
                style: greySemiBoldTexth2,
              ),
              SizedBox(height: 12),
              Text(
                "To use the Express Market app, firstly, you should have WhatsApp, WhatsApp Business, GBWhatsApp or FMWhatsApp installed on your device.",
                style: greyNormalText,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 12),
              Text(
                "The next thing will be to subscribe to our WhatsApp platform and you will be added to our groups.",
                style: greyNormalText,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 12),
              Text(
                "A small database file will be sent to the WhatsApp groups once or twice every day. If your WhatsApp is not set to auto-download documents, all you will have to do is to open the WhatsApp group and click the database file to download it. Do not attempt to open the file, just download it, and you are done.",
                style: greyNormalText,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 12),
              Text(
                "When you close your WhatsApp, if you open the Express Market app, it will automatically read the latest information from the database file you just downloaded.",
                style: greyNormalText,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 24),
              Text(
                "How to Submit a Listing?",
                style: greySemiBoldTexth2,
              ),
              SizedBox(height: 12),
              Text(
                "To submit the products you are selling or services you are offering for listing to more than 10 000 users of the Express Market app, contact us via WhatsApp on 0774671339 or visit the Express Market website on https://expressmarket.co.zw.",
                style: greyNormalText,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 12),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                    child: ElevatedButton.icon(
                        icon: FaIcon(FontAwesomeIcons.whatsapp),
                        label: Text("Open WhatsApp"),
                        onPressed: () {
                          launch("https://wa.me/$whatsAppNumber");
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 12)),
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor),
                            foregroundColor:
                                MaterialStateProperty.all(whiteColor)))),
                SizedBox(width: 5),
                Expanded(
                    child: ElevatedButton.icon(
                        icon: FaIcon(FontAwesomeIcons.internetExplorer),
                        label: Text("Go to Website"),
                        onPressed: () {
                          launch("$website");
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 12)),
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor),
                            foregroundColor:
                                MaterialStateProperty.all(whiteColor)))),
              ]),
              SizedBox(height: 24),
              Text(
                "Do I pay to submit a listing?",
                style: greySemiBoldTexth2,
              ),
              SizedBox(height: 12),
              Text(
                "Submitting a product or a service for listing on the website is free. However, if you want your listing to appear on the first page or at the top of the results, then you will have to pay a fee that is determined by our advertising team. ",
                style: greyNormalText,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 12),
              Text(
                "To find out more about sponsored (paid) listings, contact us using the links above.",
                style: greyNormalText,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 24),
              Text(
                "Have more questions?",
                style: greySemiBoldTexth2,
              ),
              SizedBox(height: 12),
              Text(
                "If you would like to ask more questions about the Express Market app, contact us by clicking the buttons above.",
                style: greyNormalText,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 24),
              SizedBox(height: 100),
            ]),
      ),
    );
  }
}
