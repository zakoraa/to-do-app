import 'package:flutter/material.dart';
import 'package:todoapp/shared/themes/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.labelText, this.controller});

  final String labelText;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText,
          labelStyle: const TextStyle(color: CustomColor.secondaryTextColor),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
        ),
      ),
    );
  }
}
