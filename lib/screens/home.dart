import 'package:alpha/includes/widgets.dart';
import 'package:alpha/models/listing.dart';
import 'package:alpha/services/colors.dart';
import 'package:alpha/services/routes.dart';
import 'package:alpha/services/styles.dart';
import 'package:alpha/widgets/custom_drawer.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ListingProvider listingProvider = Provider.of<ListingProvider>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Express Market",
            style: greyNormalText,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add_circle_outline_outlined,
                size: 30,
              ),
              onPressed: () =>
                  Navigator.of(context).pushNamed(SubmitListingRoute),
            ),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () => shareListing(),
            ),
          ],
        ),
        body: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text("Find what's on the market",
                  style: TextStyle(
                      color: greyColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  Navigator.of(context).pushNamed(SearchRoute);
                },
                decoration: InputDecoration(
                    hintText: "Type to search...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    isDense: true,
                    prefixIcon: Icon(Icons.search),
                    prefixIconConstraints:
                        BoxConstraints(maxHeight: 20, minWidth: 40),
                    contentPadding: EdgeInsets.all(15)),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                        CategoriesShowRoute,
                        arguments: {'category': 'Clothes'}),
                    child: Text("Clothes",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueGrey.shade700),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                        CategoriesShowRoute,
                        arguments: {'category': 'Gadgets'}),
                    child: Text("Gadgets",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueGrey.shade700),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                        CategoriesShowRoute,
                        arguments: {'category': 'Jobs'}),
                    child: Text("Jobs",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueGrey.shade700),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                        CategoriesShowRoute,
                        arguments: {'category': 'Phones'}),
                    child: Text("Phones",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueGrey.shade700),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                        CategoriesShowRoute,
                        arguments: {'category': 'Cars'}),
                    child: Text("Cars",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueGrey.shade700),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                        CategoriesShowRoute,
                        arguments: {'category': 'Music'}),
                    child: Text("Music",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueGrey.shade700),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Hot Deals",
                  style: greyBoldTexth2,
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(
                thickness: 2,
                // color: Colors.blueGrey.shade500,
              ),
            ),
            SizedBox(
              height: (150 * listingProvider.listingsList.length).toDouble(),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemCount: listingProvider.listingsList.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    Listing listing = listingProvider.listingsList[index];
                    return buildItemCard(context, listing);
                  }),
            )
          ],
        ),
        drawer: CustomDrawer(),
      ),
    );
  }

  shareListing() {
    String info =
        "\n\n\nGet the Express Market app today to get up-to-date information on products, jobs and any other service on the market in Zimbabwe today. \nhttps://expressmarket.co.zw";
    Share.share(info);
  }
}
