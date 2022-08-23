import 'package:flutter/material.dart';

class Themes {

  static const Color primaryClr = bluishClr;

  static const Color bluishClr = Color(0xFF4e5ae8);
  static const Color yellowClr = Color(0xFFFFB746);
  static const Color pinkClr = Color(0xFFff4667);
  static const Color white = Color(0xffffffff);
  static const Color darkGreyClr = Color(0xFF121212);
  static const Color darkHeaderClr = Color(0xFF424242);

  static final light = ThemeData(
      appBarTheme: AppBarTheme(
          color: primaryClr
      ),
      primaryColor: primaryClr,
      brightness: Brightness.light
  );

  static final dark = ThemeData(
      appBarTheme: AppBarTheme(
          color: darkGreyClr
      ),
      primaryColor: darkGreyClr,
      brightness: Brightness.dark
  );
}