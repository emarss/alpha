import 'dart:convert';
import 'dart:io';

import 'package:alpha/services/colors.dart';
import 'package:alpha/services/database.dart';
import 'package:alpha/services/globals.dart';
import 'package:alpha/services/styles.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:smart_select/smart_select.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class SubmitListingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SubmitListingScreenState();
  }
}

class SubmitListingScreenState extends State<SubmitListingScreen> {
  TextEditingController _nameFieldController = TextEditingController();
  TextEditingController _descriptionFieldController = TextEditingController();
  TextEditingController _priceFieldController = TextEditingController();
  TextEditingController _locationFieldController = TextEditingController();
  TextEditingController _sellerDetailsFieldController = TextEditingController();
  TextEditingController _whatsAppCatalogFieldController =
      TextEditingController();
  TextEditingController _whatsAppNumberFieldController =
      TextEditingController();
  TextEditingController _mobileNumberFieldController = TextEditingController();

  String _mobileNumber = "";
  String _whatsAppNumber = "";
  String _isoCode = "ZW";
  String _dialCode = "+263";

  final GlobalKey<FormState> _listingFormStateKey = GlobalKey<FormState>();

  final String listingSubmitWhatsAppNumber = "+263774671339";

  String selectedCategory = '';
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'Houses', title: 'Houses'),
    S2Choice<String>(value: 'Clothes', title: 'Clothes'),
    S2Choice<String>(value: 'Gadgets', title: 'Gadgets'),
    S2Choice<String>(value: 'Jobs', title: 'Jobs'),
    S2Choice<String>(value: 'Properties', title: 'Properties'),
    S2Choice<String>(value: 'Cars', title: 'Cars'),
    S2Choice<String>(value: 'Implements', title: 'Implements'),
    S2Choice<String>(value: 'Services', title: 'Services'),
    S2Choice<String>(value: 'Arts', title: 'Arts'),
    S2Choice<String>(value: 'Wanted List', title: 'Wanted List'),
    S2Choice<String>(value: 'Other', title: 'Other'),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Submit Listing"),
          elevation: 1,
        ),
        body: Form(
          key: _listingFormStateKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(8),
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product/Service Details",
                    style: greyBoldText,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.help,
                        color: tertiaryColor,
                      ),
                      onPressed: () => showListingInstructions())
                ],
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _nameFieldController,
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Required Field';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: whiteColor,
                  prefixIcon: Icon(Icons.label, color: primaryColor),
                  hintText: 'Name',
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _descriptionFieldController,
                textCapitalization: TextCapitalization.sentences,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Required Field';
                  }
                  return null;
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: whiteColor,
                  prefixIcon: Icon(Icons.description, color: primaryColor),
                  hintText: 'Description',
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _priceFieldController,
                textCapitalization: TextCapitalization.characters,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Required Field';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: whiteColor,
                  prefixIcon: Icon(Icons.attach_money, color: primaryColor),
                  hintText: 'Price ',
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _locationFieldController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: whiteColor,
                  prefixIcon: Icon(Icons.location_city, color: primaryColor),
                  hintText: 'Location (Optional)',
                ),
              ),
              SizedBox(height: 35.0),
              Text(
                "Product/Service Category",
                style: greyBoldText,
              ),
              SizedBox(height: 12),
              Container(
                color: Colors.white,
                padding: EdgeInsets.zero,
                child: SmartSelect<String>.single(
                    title: 'Category',
                    placeholder: "Select Category",
                    modalType: S2ModalType.bottomSheet,
                    value: selectedCategory,
                    choiceItems: options,
                    onChange: (state) =>
                        setState(() => selectedCategory = state.value)),
              ),
              SizedBox(height: 35.0),
              Text(
                "Seller/Provider Details",
                style: greyBoldText,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _sellerDetailsFieldController,
                textCapitalization: TextCapitalization.sentences,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Required Field';
                  }
                  return null;
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: whiteColor,
                  prefixIcon: Icon(Icons.person, color: primaryColor),
                  hintText: 'Seller/Provider Info',
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    _mobileNumber = number.phoneNumber;
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  initialValue: PhoneNumber(
                      isoCode: _isoCode,
                      dialCode: _dialCode,
                      phoneNumber: _mobileNumber),
                  autoValidateMode: AutovalidateMode.disabled,
                  ignoreBlank: false,
                  textFieldController: _mobileNumberFieldController,
                  keyboardType: TextInputType.phone,
                  inputDecoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    isCollapsed: true,
                    hintText: "Cell Number",
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    _whatsAppNumber = number.phoneNumber;
                    if (number.phoneNumber == _dialCode) {
                      _whatsAppNumber = "";
                    }
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  initialValue: PhoneNumber(
                      isoCode: _isoCode,
                      dialCode: _dialCode,
                      phoneNumber: _whatsAppNumber),
                  autoValidateMode: AutovalidateMode.disabled,
                  ignoreBlank: true,
                  textFieldController: _whatsAppNumberFieldController,
                  keyboardType: TextInputType.phone,
                  inputDecoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    isCollapsed: true,
                    hintText: "WhatsApp Number (Optional)",
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              SizedBox(height: 35.0),
              Text(
                "More Information",
                style: greyBoldText,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _whatsAppCatalogFieldController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: whiteColor,
                  prefixIcon: Icon(Icons.link, color: primaryColor),
                  hintText: 'Website/WhatsApp Link (Optional)',
                ),
              ),
              Divider(height: 15.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => sumbitListing(),
                      icon:
                          FaIcon(FontAwesomeIcons.whatsapp, color: whiteColor),
                      label: Text("Submit Listing",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade700),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100.0),
            ]),
          ),
        ),
      ),
    );
  }

  sumbitListing() async {
    if (_listingFormStateKey.currentState.validate()) {
      if (selectedCategory.length == 0) {
        showMessageBox(context, "Please, select a category.");
        return;
      }

      Map sharedListing = {
        columnName: _nameFieldController.text,
        columnDescription: _descriptionFieldController.text,
        columnPrice: _priceFieldController.text,
        columnSellerDetails: _sellerDetailsFieldController.text,
        columnMobileNumber: _mobileNumber,
        columnCategory: selectedCategory,
        columnWhatsAppBusinessLink: _whatsAppCatalogFieldController.text,
        columnWhatsAppNumber: _whatsAppNumber,
        columnLocation: _locationFieldController.text,
        columnUUID: Uuid().v1(),
      };
      String info = jsonEncode(sharedListing);
      final dir = await getExternalStorageDirectory();
      final path = "${dir.path}/files";
      await new Directory(path).create(recursive: true);

      String fileName = "em_listing" +
          DateTime.now().year.toString() +
          "_" +
          DateTime.now().month.toString() +
          "_" +
          DateTime.now().day.toString() +
          ".emlf";
      String filePath = "$path/$fileName";
      final File file = File(filePath);

      //Encrypting data
      final key = encrypt.Key.fromUtf8(encryptionKey);
      final iv = encrypt.IV.fromLength(16);

      final encrypter = encrypt.Encrypter(encrypt.AES(key));

      final String encryptedData =
          encrypter.encrypt(jsonEncode(info), iv: iv).base64;
      await file.writeAsString(encryptedData);

      await Share.shareFiles([filePath],
          text: "$fileName", subject: "Express Market Listing Submission.");
    }
  }

  showListingInstructions() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Info"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      "Fill out the form below and press the submit button to send your listing to the Express Market WhatsApp number. \n\nIf you have not yet saved our number, click the button below to save."),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            launch("tel:$listingSubmitWhatsAppNumber");
                          },
                          child: Text(
                            "Save our Number",
                            style: greyBoldText,
                          )),
                      TextButton(
                        child: Text('Close'),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                darkMuteColor)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
