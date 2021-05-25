import 'package:alpha/services/colors.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

TextStyle greyNormalText = TextStyle(color: primaryColor);
TextStyle greyBoldText =
    TextStyle(color: primaryColor, fontWeight: FontWeight.bold);
TextStyle greySemiBoldText =
    TextStyle(color: primaryColor, fontWeight: FontWeight.w700);
TextStyle greySemiBoldTexth2 =
    TextStyle(color: primaryColor, fontWeight: FontWeight.w700, fontSize: 18);
TextStyle greySemiBoldTexth3 =
    TextStyle(color: primaryColor, fontWeight: FontWeight.w700, fontSize: 17);
TextStyle greyNormalTextSmall = TextStyle(color: primaryColor, fontSize: 13);
TextStyle greyBoldTexth2 =
    TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18);
TextStyle greyBoldTexth3 =
    TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 17);

TextStyle muteSemiBoldTexth2 =
    TextStyle(color: muteColor, fontWeight: FontWeight.w700, fontSize: 18);
TextStyle muteSemiBoldText =
    TextStyle(color: muteColor, fontWeight: FontWeight.w700);
TextStyle muteNormalTextSmall = TextStyle(color: muteColor, fontSize: 13);

TextStyle whiteNormalText = TextStyle(color: Colors.white);
TextStyle whiteSemiBoldTexth2 =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18);
TextStyle whiteSemiBoldText =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w700);
TextStyle whiteNormalTextSmall = TextStyle(color: Colors.white, fontSize: 13);

AlertStyle rAlertStyleNotDismissible = AlertStyle(
    alertBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    isCloseButton: false,
    animationType: AnimationType.fromBottom,
    isOverlayTapDismiss: false,
    alertPadding: EdgeInsets.all(10),
    descStyle: TextStyle(fontSize: 15),
    titleStyle: TextStyle(fontWeight: FontWeight.w800));
