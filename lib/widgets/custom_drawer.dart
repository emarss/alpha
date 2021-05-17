import 'package:alpha/services/colors.dart';
import 'package:alpha/services/routes.dart';
import 'package:alpha/services/styles.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
              child:
                  Image.asset("assets/images/logo.png", width: 80, height: 80)),
          Column(
            children: [
              Text(
                "Express Market",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Developed by Emarss Technologies",
                style: muteNormalTextSmall,
              )
            ],
          ),
          Divider(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    Icon(Icons.home, color: muteColor),
                    SizedBox(width: 16),
                    Text(
                      "Home",
                      style: greyBoldText,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.chevron_right, color: muteColor),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(CategoriesRoute);
                },
                child: Row(
                  children: [
                    Icon(Icons.bar_chart, color: muteColor),
                    SizedBox(width: 16),
                    Text(
                      "Categories",
                      style: greyBoldText,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.chevron_right, color: muteColor),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(FavouritesRoute);
                },
                child: Row(
                  children: [
                    Icon(Icons.favorite, color: muteColor),
                    SizedBox(width: 16),
                    Text(
                      "Favourites",
                      style: greyBoldText,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.chevron_right, color: muteColor),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(AboutRoute);
                },
                child: Row(
                  children: [
                    Icon(Icons.info, color: muteColor),
                    SizedBox(width: 16),
                    Text(
                      "About",
                      style: greyBoldText,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.chevron_right, color: muteColor),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(HelpRoute);
                },
                child: Row(
                  children: [
                    Icon(Icons.help, color: muteColor),
                    SizedBox(width: 16),
                    Text(
                      "Help",
                      style: greyBoldText,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.chevron_right, color: muteColor),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
