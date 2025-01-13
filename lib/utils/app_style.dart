import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final primaryColor = Color(0xff0A8ED9);
final secondaryColor = Color(0xff0A8ED980);
final whiteColor = Colors.white;
final blackColor = Colors.black;
final transparentColor = Color(0xff0000003D);
final bgColor = Colors.grey[50];
final greyColor = Color(0xff858585);
final simpleGrey = Color(0xffF7F7F7);

final defaultTextStyle = GoogleFonts.raleway(
  fontSize: 19,
  fontWeight: FontWeight.w500,
  color: blackColor,
);

final bodySmallText = GoogleFonts.raleway(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: greyColor,
);

ThemeData theme_data() => ThemeData(
      primaryColor: primaryColor, // Dark gray background color
      scaffoldBackgroundColor: Color(0xFF1A1A1A), // Dark gray background color
      appBarTheme: AppBarTheme(
        backgroundColor: whiteColor,
        foregroundColor: blackColor, // Dark gray app bar color
        iconTheme: IconThemeData(color: Colors.white), // White icons
      ),
      textTheme: TextTheme(
          bodySmall: defaultTextStyle.copyWith(
              fontSize: 14, fontWeight: FontWeight.w400)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              primaryColor), // Pink button background
          foregroundColor:
              MaterialStateProperty.all<Color>(whiteColor), // Black button text
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: InputBorder.none,
        fillColor: Color(0xffF7F7F7), // Dark gray input field background
        hintStyle: TextStyle(color: Colors.grey), // White hint text
      ),
    );
