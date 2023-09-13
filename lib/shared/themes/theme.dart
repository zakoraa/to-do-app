import 'package:flutter/material.dart';
import 'package:todoapp/shared/themes/color.dart';

class CustomTheme {
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
      scaffoldBackgroundColor: CustomColor.primaryColor,
      textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 12)));
}
