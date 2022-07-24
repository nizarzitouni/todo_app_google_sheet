import 'package:flutter/material.dart';

final primaryColor = Color(0xff93b5c6);
final secondaryColor = Color(0xffc9ccd5);
final primarySwatchCO = Color(0xffffe3e3);
final forthSwatch = Color(0xffe4d8dc);

final appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    centerTitle: true,
  ),
  brightness: Brightness.light,
  primaryColor: primaryColor,
  colorScheme: ColorScheme.light(
    primary: primaryColor,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryColor),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: secondaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: primaryColor),
    iconColor: secondaryColor,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: secondaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: primarySwatchCO),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
