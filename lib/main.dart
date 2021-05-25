import 'package:alpha/models/listing.dart';
import 'package:alpha/screens/about.dart';
import 'package:alpha/screens/categories.dart';
import 'package:alpha/screens/categories_show.dart';
import 'package:alpha/screens/favourites.dart';
import 'package:alpha/screens/help.dart';
import 'package:alpha/screens/index.dart';
import 'package:alpha/screens/listing_show.dart';
import 'package:alpha/screens/search.dart';
import 'package:alpha/screens/submit_listing.dart';
import 'package:alpha/screens/welcome.dart';
import 'package:alpha/services/colors.dart';
import 'package:alpha/services/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ListingProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Express Market',
      theme: _themeData(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _routes(),
    );
  }

  ThemeData _themeData() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic),
        hintStyle: TextStyle(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic),
      ),
      primarySwatch: Colors.grey,
      fontFamily: "Lato",
      appBarTheme: AppBarTheme(
          color: lightGreyColor,
          elevation: 0,
          iconTheme: IconThemeData(color: greyColor)),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      ),
      scaffoldBackgroundColor: lightGreyColor,
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case HomeRoute:
          screen = IndexScreen();
          break;

        case WelcomeRoute:
          screen = WelcomeScreen();
          break;
        case CategoriesRoute:
          screen = CategoriesScreen();
          break;
        case FavouritesRoute:
          screen = FavouritesScreen();
          break;
        case AboutRoute:
          screen = AboutScreen();
          break;
        case HelpRoute:
          screen = HelpScreen();
          break;

        case ListingShowRoute:
          screen = ListingShowScreen(
            listingUUID: arguments['listingUUID'],
          );
          break;
        case CategoriesShowRoute:
          screen = CategoriesShowScreen(
            category: arguments['category'],
          );
          break;

        case SearchRoute:
          screen = SearchScreen();
          break;

        case SubmitListingRoute:
          screen = SubmitListingScreen();
          break;

        default:
          screen = IndexScreen();
          break;
      }

      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
