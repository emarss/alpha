import 'package:alpha/services/colors.dart';
import 'package:alpha/services/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:share/share.dart';
import 'package:smart_select/smart_select.dart';
import 'package:url_launcher/url_launcher.dart';

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

  String selectedCategory = 'flutter';
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'Gadgets', title: 'Gadgets'),
    S2Choice<String>(value: 'Clothes', title: 'Clothes'),
    S2Choice<String>(value: 'Jobs', title: 'Jobs'),
    S2Choice<String>(value: 'Cars', title: 'Cars'),
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
          child: ListView(
              padding: EdgeInsets.all(8),
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                SizedBox(height: 12.0),
                Container(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                        "Fill out the form below and press the submit button to send your listing to our WhatsApp number and it will be listed.")),
                Text(
                  "Product/Service Details",
                  style: greyBoldText,
                ),
                Divider(),
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
                      hintStyle: greyNormalText),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: _descriptionFieldController,
                  textCapitalization: TextCapitalization.words,
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
                      hintStyle: greyNormalText),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: _priceFieldController,
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
                      prefixIcon: Icon(Icons.attach_money, color: primaryColor),
                      hintText: 'Price ',
                      hintStyle: greyNormalText),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: _locationFieldController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: whiteColor,
                      prefixIcon:
                          Icon(Icons.location_city, color: primaryColor),
                      hintText: 'Location (Optional)',
                      hintStyle: greyNormalText),
                ),
                SizedBox(height: 35.0),
                Text(
                  "Product/Service Category",
                  style: greyBoldText,
                ),
                Divider(),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  child: SmartSelect<String>.single(
                      title: 'Category',
                      placeholder: "Select Category",
                      modalType: S2ModalType.popupDialog,
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
                Divider(),
                TextFormField(
                  controller: _sellerDetailsFieldController,
                  textCapitalization: TextCapitalization.words,
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
                      hintStyle: greyNormalText),
                ),
                SizedBox(height: 15.0),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.zero,
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
                  padding: EdgeInsets.zero,
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      _whatsAppNumber = number.phoneNumber;
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
                  "WhatsApp Business",
                  style: greyBoldText,
                ),
                Divider(),
                TextFormField(
                  controller: _whatsAppCatalogFieldController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: whiteColor,
                      prefixIcon: Icon(Icons.link, color: primaryColor),
                      hintText: 'Catalog Link (Optional)',
                      hintStyle: greyNormalText),
                ),
                Divider(height: 15.0),
                ElevatedButton.icon(
                  onPressed: () => sumbitListing(),
                  icon: FaIcon(FontAwesomeIcons.whatsapp, color: whiteColor),
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
                SizedBox(height: 100.0),
              ]),
        ),
      ),
    );
  }

  sumbitListing() {
    if (_listingFormStateKey.currentState.validate()) {
      String info =
          "REQUESTING LISTING FOR: %0a%0a${_nameFieldController.text} %0a%0a${_descriptionFieldController.text} %0a%0aPrice: ${_priceFieldController.text} %0a%0aLocation: ${_locationFieldController.text} %0a%0a%0aCategory: $selectedCategory %0a%0a%0aUser Details: ${_sellerDetailsFieldController.text} %0a%0aCell Number: $_mobileNumber  %0a%0aWhatsApp Number: $_whatsAppNumber %0a%0aWhatsApp Business Link: ${_whatsAppCatalogFieldController.text}";
      launch("https://wa.me/$listingSubmitWhatsAppNumber?text=$info");
    }
  }
}
