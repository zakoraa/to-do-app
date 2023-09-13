import 'package:flutter/material.dart';
import 'package:todoapp/module/home/widgets/completed_content.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Completed",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        SizedBox(
          height: 10.0,
        ),
        CompletedContent(),
      ],
    );
  }
}
