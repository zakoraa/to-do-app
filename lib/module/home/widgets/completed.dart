import 'package:flutter/material.dart';
import '../../../shared/themes/color.dart';
import 'check_box_active.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Completed",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
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
                mainAxisAlignment: MainAxisAlignment.start,
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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Completed on April 4, 2005",
                        style: TextStyle(
                            color: CustomColor.secondaryTextColor,
                            fontSize: 10))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
