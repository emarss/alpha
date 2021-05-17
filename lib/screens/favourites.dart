import 'package:alpha/includes/widgets.dart';
import 'package:alpha/models/listing.dart';
import 'package:alpha/services/colors.dart';
import 'package:alpha/services/styles.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FavouritesScreenState();
  }
}

class FavouritesScreenState extends State<FavouritesScreen> {
  TextEditingController _searchQueryController = TextEditingController();
  String _searchKey = "";

  @override
  Widget build(BuildContext context) {
    List<Listing> listingsList = Provider.of<ListingProvider>(context)
        .listingsList
        .where((Listing lst) => lst.isFavourite == 1)
        .where((Listing lst) =>
            lst.name.toLowerCase().contains(_searchKey.toLowerCase()) ||
            lst.description.toLowerCase().contains(_searchKey.toLowerCase()) ||
            lst.location.toLowerCase().contains(_searchKey.toLowerCase()) ||
            lst.sellerDetails.toLowerCase().contains(_searchKey.toLowerCase()))
        .toList();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Favourites"),
          elevation: 1,
        ),
        body: ListView(
            padding: EdgeInsets.symmetric(vertical: 8),
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchQueryController,
                        onChanged: (value) {
                          setState(() {
                            _searchKey = value;
                          });
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
                  ],
                ),
              ),
              SizedBox(height: 8),
              listingsList.length == 0
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height - 300,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shop_two_outlined,
                                size: 80,
                                color: secondaryColor,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            "No favourites listings found.",
                            style: greySemiBoldText,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: (150 * listingsList.length).toDouble(),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          itemCount: listingsList.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            Listing listing = listingsList[index];
                            return buildItemCard(context, listing);
                          }),
                    )
            ]),
      ),
    );
  }
}
