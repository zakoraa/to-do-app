import 'package:flutter/material.dart';
import 'package:todoapp/module/home/widgets/check_box_active.dart';
import 'package:todoapp/shared/themes/color.dart';

class CompletedContent extends StatelessWidget {
  const CompletedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: const Row(
        children: [
          SizedBox(
            width: 15.0,
          ),
          CheckBoxActive(),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Belajar Dart",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "💻 Programming",
                style: TextStyle(color: CustomColor.secondaryTextColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
