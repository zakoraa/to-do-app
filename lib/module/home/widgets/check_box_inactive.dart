import 'package:flutter/material.dart';

import '../../../shared/themes/color.dart';

class CheckBoxInactive extends StatelessWidget {
  const CheckBoxInactive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: CustomColor.secondaryTextColor,
      ),
    );
  }
}
