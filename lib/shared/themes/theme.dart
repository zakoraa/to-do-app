import 'package:flutter/material.dart';
import 'package:todoapp/shared/themes/color.dart';

class CustomTheme {
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
      scaffoldBackgroundColor: CustomColor.primaryColor,
      textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 12)));

  static ThemeData get lightTheme => ThemeData.light().copyWith(
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
