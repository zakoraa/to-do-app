import 'package:flutter/material.dart';
import 'package:todoapp/shared/themes/color.dart';

class CustomTheme {
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
      dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.white,
      )),
      primaryColor: CustomColor.backgroundColor,
      scaffoldBackgroundColor: CustomColor.primaryColor,
      textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 12, color: Colors.white)));

  static ThemeData get lightTheme => ThemeData.light().copyWith(
      dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.black,
      )),
      primaryColor: Colors.white,
      datePickerTheme: const DatePickerThemeData(
          backgroundColor: Colors.white,
          headerBackgroundColor: CustomColor.secondaryTextColor),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
        fontSize: 12,
        color: Colors.black,
      )));
}
