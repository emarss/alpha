import 'package:alpha/models/listing.dart';
import 'package:alpha/screens/home.dart';
import 'package:alpha/screens/welcome.dart';
import 'package:alpha/services/colors.dart';
import 'package:alpha/services/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexScreenState();
  }
}

class IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: applicationStarter(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                backgroundColor: primaryColor,
              ) //todo: replace with app logo
                  ),
            );
          }

          if (Provider.of<ListingProvider>(context).listingsList.isNotEmpty) {
            return HomeScreen();
          } else {
            return WelcomeScreen();
          }
        });
  }
}
