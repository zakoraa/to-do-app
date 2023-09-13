import 'package:flutter/material.dart';

import '../../../shared/themes/color.dart';

class CheckBoxActive extends StatelessWidget {
  const CheckBoxActive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: CustomColor.secondaryColor),
      child: const Center(
        child: Icon(
          Icons.check,
          weight: 14,
          size: 16,
        ),
      ),
    );
  }
}
