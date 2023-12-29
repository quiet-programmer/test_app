import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:html/parser.dart';
import 'package:my_template/utils/hex_to_color.dart';

var logger = Logger();

String apiUrl = 'https://api.liteteller.ng';
// String flwKey = 'FLWPUBK_TEST-f38ab43db55eeedd2f375ab8a69f8820-X';
String flwKey = 'FLWPUBK-6a3c3f2fc9acd217fa71656ec142fed6-X';

//other colors
const defaultWhite = Color.fromRGBO(255, 255, 255, 1);
const defaultBlack = Color.fromRGBO(0, 0, 0, 1);
//

// ios indicator size
const double iOSIndicatorSize = 20;

// asset exports
String iconsAssets = 'assets/icons';
String gifsAssets = 'assets/gifs';
String imagesAssets = 'assets/images';
String svgAssets = 'assets/svg';

// dark and light theme color
Color? darkColor = Colors.grey[900];

Color? cardColor = Colors.grey[850];

//colors for the app
const Color backColor = Color.fromRGBO(21, 32, 54, 1);
Color frontColor = hexToColor('#6F3BED');
Color frontColorTwo = hexToColor('#f0eef7');
Color secondaryColor = hexToColor('#e0dee8');
Color primaryGrey = hexToColor('#F9F9F9');
Color secondaryGrey = hexToColor('#F5F5F5');
Color primaryGold = hexToColor('#C9B902');
Color transparent = Colors.transparent;
Color btnBorderColor = hexToColor('#CCE8D4');
Color greyTextColor = hexToColor('#919191');
Color textFieldBorderColor = hexToColor('#938989');

Color dialogColor = Colors.white;
Color backColorOne = Colors.white;
Color defaultTextColor = Colors.black;


const Color boxColor = Color.fromRGBO(235, 237, 242, 1);

Color grey = hexToColor('#AFACAB');
Color mGrey = grey.withOpacity(0.4);

// hive box name
const String userModel = 'userModel';
const String invoiceModel = 'invoiceModel';

// hive store key
const String userKey = 'userKey';
const String userAuthKey = 'userAuthKey';
const String invoiceKey = 'invoiceKey';
const String tokenKey = 'tokenKey';
const String localTokenKey = 'localTokenKey';
const String balanceAmountKey = 'balanceAmountKey';
const String balanceKey = 'balanceKey';
const String firstLoginKey = 'firstLoginKey';
const String allowNotificationKey = 'allowNotificationKey';
const String bioAuthKey = 'bioAuthKey';
const String totalSumKey = 'totalSumKey';
const String lockPinKey = 'lockPinKey';

currencyFormatterString(amount) {
  double parseAmount = double.parse(amount);
  var eurosInUSFormat = NumberFormat.currency(locale: "en_US", symbol: "N");
  var mAmount = eurosInUSFormat.format(parseAmount);
  return mAmount;
}


currencyFormatter(amount, symbol) {
  var eurosInUSFormat = NumberFormat.currency(locale: "en_US", symbol: symbol);
  var mAmount = eurosInUSFormat.format(amount);
  return mAmount;
}


currencyFormatterNumber(amount) {
  var eurosInUSFormat = NumberFormat.currency(locale: "en_US", symbol: "N");
  var mAmount = eurosInUSFormat.format(amount);
  return mAmount;
}

currencyFormatterSymbol(amount, context) {
  Locale locale = Localizations.localeOf(context);
  var format = NumberFormat.simpleCurrency(locale: Platform.localeName, name: "NGN");
  var mAmount = format.format(amount);
  return mAmount;
}

String parseHtmlString(String htmlString) {
  var document = parse(htmlString);
  String parsedString = parse(document.body!.text).documentElement!.text;
  return parsedString;
}