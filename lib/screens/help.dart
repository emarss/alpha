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
                      "The Welcome screen is normally shown when you open this app for the first time. \n\nIf you are not opening the app for the first time, but you keep seeing the Welcome screen, this might mean that you have not yet received a database file from our WhatsApp group or number within the past 7 days. You see the Welcome screen when the app has no data to show you. \n\nTo get the data, you can contact us by clicking the subscribe button on the Welcome Screen. \n\nIf you have just received the database file, but you are still seeing the Welcome screen, please, contact us.",
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
                "To use the Express Market app, firstly, you should have WhatsApp installed on your device. \n\nThe next thing will be to subscribe to our WhatsApp platform and you will be added to our groups. A small database file will be sent to the WhatsApp groups twice every day, in the morning and the evening.  If you download this file and open it using the Express Market app, the app will show you all the latest listings. \n\nHowever, even if you do not open the file, and just download it, when you open the app, it will automatically read data from the file and listings will be updated.",
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
                "To submit the products you are selling or services you are offering for listing to thousands of the Express Market app, click the plus sign at the top of the Home screen of the app. \n\nFill out the form on the screen and press the submit button. You will be prompted to share a file that ends with .emlf. Go ahead and share the file to the Express Market WhatsApp number : ",
                style: greyNormalText,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 24),
              Text(
                "Do I pay to submit a listing?",
                style: greySemiBoldTexth2,
              ),
              SizedBox(height: 12),
              Text(
                "Listing a product or service on the Express Market app is free. \n\nHowever, to get a priority listing, and have your product or service appear at the top of other listings, contact us now to get the information on current prices. ",
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
                "If you would like to ask more questions about the Express Market app, contact us by clicking the button below.",
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
                // SizedBox(width: 5),
                //      Expanded(
                //     child: ElevatedButton.icon(
                //         icon: FaIcon(FontAwesomeIcons.internetExplorer),
                //         label: Text("Go to Website"),
                //         onPressed: () {
                //           launch("$website");
                //         },
                //         style: ButtonStyle(
                //             padding: MaterialStateProperty.all(
                //                 EdgeInsets.symmetric(vertical: 12)),
                //             backgroundColor:
                //                 MaterialStateProperty.all(primaryColor),
                //             foregroundColor:
                //                 MaterialStateProperty.all(whiteColor)))),
              ]),
              SizedBox(height: 24),
              Text(
                "What are the advantages of using the Express Market App?",
                style: greySemiBoldTexth2,
              ),
              SizedBox(height: 12),
              Text(
                "The Express Market app allows you to sell, buy or get any service very fast in Zimbabwe, without internet access. All you need is your WhatsApp and you get all the information of thousands of people offering different products and services. \n\nYou will be able to quickly search and filter the listings by category. \n\nAnother advantage of the Express Market App is that listings are automatically deleted after every 7 days. This means you are almost certain that a product you have seen listed is still in stock because it was recently listed.",
                style: greyNormalText,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 24),
              Text(
                "For how long does a listing stay on the app?",
                style: greySemiBoldTexth2,
              ),
              SizedBox(height: 12),
              Text(
                "To ensure that a listing does not stay on the app long after the product has been sold, every listing is deleted after every 7 days.",
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
