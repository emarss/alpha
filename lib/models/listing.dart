import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:alpha/services/database.dart';
import 'package:uuid/uuid.dart';

class Listing {
  String uuid;
  String name;
  String description;
  String price;
  String sellerDetails;
  String mobileNumber;
  String category;
  String whatsAppNumber;
  String whatsAppBusinessLink;
  String location;
  int priority;
  int isHot;
  int isFavourite;
  int createdAt;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnDescription: description,
      columnPrice: price,
      columnSellerDetails: sellerDetails,
      columnMobileNumber: mobileNumber,
      columnCategory: category,
      columnWhatsAppBusinessLink: whatsAppBusinessLink,
      columnWhatsAppNumber: whatsAppNumber,
      columnLocation: location,
      columnPriority: priority,
      columnIsHot: isHot,
      columnIsFavourite: isFavourite,
    };
    if (uuid == null) {
      map[columnUUID] = Uuid().v1();
    } else {
      map[columnUUID] = uuid;
    }
    if (createdAt != null) {
      map[columnCreatedAt] = createdAt;
    }

    return map;
  }

  Listing.fromMap(Map<String, dynamic> map) {
    uuid = map[columnUUID];
    name = map[columnName];
    description = map[columnDescription];
    price = map[columnPrice];
    sellerDetails = map[columnSellerDetails];
    mobileNumber = map[columnMobileNumber];
    category = map[columnCategory];
    whatsAppBusinessLink = map[columnWhatsAppBusinessLink];
    whatsAppNumber = map[columnWhatsAppNumber];
    location = map[columnLocation];
    priority = int.tryParse((map[columnPriority]).toString());
    isHot = int.tryParse((map[columnIsHot]).toString());
    isFavourite = int.tryParse((map[columnIsFavourite]).toString());

    createdAt = map[columnCreatedAt] != null
        ? int.tryParse((map[columnCreatedAt]).toString())
        : DateTime.now().millisecondsSinceEpoch;
  }

  String getWhatsAppNumber() {
    if (whatsAppNumber.length == 0) {
      return "--";
    }
    return whatsAppNumber;
  }

  bool hasWhatsAppNumber() {
    if (whatsAppNumber.length == 0) {
      return false;
    }
    return true;
  }

  bool hasWhatsAppBusinessLink() {
    if (whatsAppBusinessLink.length == 0) {
      return false;
    }
    return true;
  }

  String getLocation() {
    if (location.length == 0) {
      return "--";
    }
    return location;
  }

  String getCreatedAt() {
    var date = DateTime.fromMillisecondsSinceEpoch(createdAt);
    return DateFormat.yMMMd().add_jm().format(date).toString();
  }
}

/*
* class Listing Provider
*/
class ListingProvider with ChangeNotifier {
  List<Listing> listingsList = [];
  ListingProvider() {
    getAllListings();
  }

  Future<void> insert(Listing listing) async {
    await db.insert(tableListings, listing.toMap());
    getAllListings();
  }

  Future<void> getAllListings() async {
    List<Map<String, dynamic>> records =
        await db.query(tableListings, orderBy: "$columnPriority DESC");

    List<Listing> _listings = [];
    if (records.length > 0) {
      for (int i = 0; i < records.length; i++) {
        _listings.add(Listing.fromMap(records[i]));
        // print(Listing.fromMap(records[i]).createdAt);
      }
    }
    listingsList = _listings;
    notifyListeners();
  }

  Future<void> deleteOldListings() async {
    int sevenDaysTimestamp =
        DateTime.now().millisecondsSinceEpoch - (7 * 24 * 60 * 60 * 1000);
    await db.delete(tableListings,
        where: "$columnCreatedAt < ? AND $columnIsFavourite != ?",
        whereArgs: [sevenDaysTimestamp, 1]);

    getAllListings();
  }

  // Future<void> delete(String uuid) async {
  //   await db.delete(tableListings, where: '$columnUUID = ?', whereArgs: [uuid]);
  // }

  Future<void> update(Listing listing) async {
    await db.update(tableListings, listing.toMap(),
        where: '$columnUUID = ?', whereArgs: [listing.uuid]);
    notifyListeners();
  }

  Future<void> toggleFavourite(Listing listing) async {
    if (listing.isFavourite == 1) {
      listing.isFavourite = 0;
    } else {
      listing.isFavourite = 1;
    }
    await db.update(tableListings, listing.toMap(),
        where: '$columnUUID = ?', whereArgs: [listing.uuid]);
    notifyListeners();
  }
}
