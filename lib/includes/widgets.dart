import 'package:alpha/models/listing.dart';
import 'package:alpha/services/colors.dart';
import 'package:alpha/services/routes.dart';
import 'package:alpha/services/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildItemCard(BuildContext context, Listing listing) {
  return InkWell(
    onTap: () => Navigator.of(context)
        .pushNamed(ItemShowRoute, arguments: {'listingUUID': listing.uuid}),
    child: Card(
      // elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      color: Colors.grey.shade200,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(listing.name, style: greySemiBoldText),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            listing.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: greyNormalTextSmall,
                          )
                        ],
                      )),
                ),
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
                  color: primaryColor,
                  alignment: Alignment.centerRight,
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.attach_money, size: 20, color: greyColor),
                    Text(
                      listing.price,
                      style: greyNormalTextSmall,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.location_on, size: 20, color: greyColor),
                    Text(
                      listing.getLocation(),
                      style: greyNormalTextSmall,
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    ),
  );
}
