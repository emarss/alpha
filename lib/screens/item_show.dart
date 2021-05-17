import 'package:alpha/models/listing.dart';
import 'package:alpha/services/colors.dart';
import 'package:alpha/services/styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemShowScreen extends StatefulWidget {
  final String listingUUID;

  const ItemShowScreen({Key key, @required this.listingUUID}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new ItemShowScreenState();
  }
}

class ItemShowScreenState extends State<ItemShowScreen> {
  @override
  Widget build(BuildContext context) {
    Listing listing = Provider.of<ListingProvider>(context)
        .listingsList
        .firstWhere((Listing lst) => lst.uuid == widget.listingUUID);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          listing.name,
          style: greyNormalText,
        ),
        elevation: 1,
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(vertical: 16),
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              title: Row(
                children: [
                  Expanded(child: Text("ITEM DETAILS", style: greyBoldText)),
                  IconButton(
                    icon: Icon(
                      listing.isFavourite == 1
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      Provider.of<ListingProvider>(context, listen: false)
                          .toggleFavourite(listing);
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      color: primaryColor,
                    ),
                    onPressed: () => shareListing(listing),
                  )
                ],
              ),
            ),
            Divider(),
            ListTile(
              dense: true,
              leading: Icon(Icons.label, color: secondaryColor),
              visualDensity: VisualDensity.compact,
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(listing.name, style: greyNormalText),
              ),
              title: Text(
                "Name:",
                style: greySemiBoldText,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.description, color: secondaryColor),
              visualDensity: VisualDensity.compact,
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(listing.description,
                    textAlign: TextAlign.justify, style: greyNormalText),
              ),
              title: Text(
                "Description:",
                style: greySemiBoldText,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.attach_money, color: secondaryColor),
              visualDensity: VisualDensity.compact,
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(listing.price, style: greyNormalText),
              ),
              title: Text(
                "Price:",
                style: greySemiBoldText,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.location_on, color: secondaryColor),
              visualDensity: VisualDensity.compact,
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(listing.getLocation(), style: greyNormalText),
              ),
              title: Text(
                "Location:",
                style: greySemiBoldText,
              ),
            ),
            SizedBox(height: 24),
            ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              title: Text("MORE DETAILS", style: greyBoldText),
            ),
            Divider(),
            ListTile(
              dense: true,
              leading: Icon(Icons.person, color: secondaryColor),
              visualDensity: VisualDensity.compact,
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(listing.sellerDetails,
                    style: greyNormalText, textAlign: TextAlign.justify),
              ),
              title: Text(
                "User Details:",
                style: greySemiBoldText,
              ),
            ),
            ListTile(
              dense: true,
              leading: FaIcon(FontAwesomeIcons.whatsapp, color: secondaryColor),
              visualDensity: VisualDensity.compact,
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(listing.getWhatsAppNumber(), style: greyNormalText),
              ),
              title: Text(
                "WhatsApp Number:",
                style: greySemiBoldText,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.local_phone, color: secondaryColor),
              visualDensity: VisualDensity.compact,
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(listing.mobileNumber, style: greyNormalText),
              ),
              title: Text(
                "Cell Number:",
                style: greySemiBoldText,
              ),
            ),
            // SizedBox(height: 16),
            SizedBox(height: 24),
            ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              title: Text("CONTACT SELLER", style: greyBoldText),
            ),
            // Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        child: Icon(Icons.local_phone, color: whiteColor),
                        onPressed: () {
                          launch("tel:${listing.getWhatsAppNumber()}");
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 12)),
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor))),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                        child: FaIcon(FontAwesomeIcons.envelope,
                            color: whiteColor),
                        onPressed: () {
                          sendSMS(
                              message: "", recipients: [listing.mobileNumber]);
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 12)),
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor))),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                        child: FaIcon(FontAwesomeIcons.whatsapp,
                            color: whiteColor),
                        onPressed: listing.hasWhatsAppNumber()
                            ? () {
                                launch(
                                    "https://wa.me/${listing.getWhatsAppNumber()}");
                              }
                            : null,
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 12)),
                            backgroundColor: listing.hasWhatsAppNumber()
                                ? MaterialStateProperty.all(primaryColor)
                                : MaterialStateProperty.all(darkMuteColor))),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            if (listing.hasWhatsAppBusinessLink())
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton.icon(
                    onPressed: () {
                      launch(listing.whatsAppBusinessLink);
                    },
                    label: Text("VIEW CATALOGUE"),
                    icon: FaIcon(FontAwesomeIcons.whatsapp),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 12)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(whiteColor),
                    )),
              ),
          ]),
    );
  }

  shareListing(Listing listing) {
    String info =
        "EXPRESS MARKET LISTING \n${listing.name} \n\n${listing.description} \n\nPrice: ${listing.price} \n\nLocation: ${listing.getLocation()} \n\n\nUser Details: ${listing.sellerDetails} \n\nCell Number: ${listing.mobileNumber}";
    if (listing.hasWhatsAppNumber()) {
      info = info +
          " \n\nWhatsApp Number: https://wa.me/${listing.getWhatsAppNumber()}";
    }
    info = info +
        " \n\n\nGet the Express Market app today to get up-to-date information on products, jobs and any other service on the market in Zimbabwe today. \nhttps://expressmarket.co.zw";
    Share.share(info);
  }
}
