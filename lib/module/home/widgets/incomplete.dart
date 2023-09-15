import 'package:flutter/material.dart';
import 'package:todoapp/module/home/widgets/incomplete_content.dart.dart';

class Incomplete extends StatelessWidget {
  const Incomplete({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Incomplete",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        SizedBox(
          height: 20.0,
        ),
        IncompleteContent()
      ],
    );
  }
}
