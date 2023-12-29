import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'const_value.dart';

ThemeData buildLightTheme() => ThemeData.light().copyWith(
  primaryColor: frontColor,
  cardColor: Colors.white,
  scaffoldBackgroundColor: frontColorTwo,

  textSelectionTheme: TextSelectionThemeData(
    selectionColor: frontColor.withOpacity(0.5),
    selectionHandleColor: frontColor,
  ),
  iconTheme: const IconThemeData(
    color: defaultBlack,
  ),
  // test
  cardTheme: const CardTheme(
    color: Colors.white,
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: defaultWhite,
  ),
  dividerColor: grey,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    color: frontColorTwo,
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.grey[900],
    ),
  ),
  textTheme: Typography.blackCupertino,
  indicatorColor: frontColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: frontColor,
    ),
  ),
);

ThemeData buildDarkTheme() => ThemeData.dark().copyWith(
  cardColor: Colors.grey[850],
  backgroundColor: Colors.grey[900],
  scaffoldBackgroundColor: darkColor,
  dividerColor: defaultBlack,
  iconTheme: const IconThemeData(
    color: defaultWhite,
  ),
  cardTheme: CardTheme(
    color: cardColor,
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: defaultBlack,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    color: Colors.grey[900],
    iconTheme: IconThemeData(
      color: Colors.grey[400],
    ),
  ),
  textTheme: Typography.whiteCupertino,
);