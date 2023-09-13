import 'package:flutter/material.dart';

class CompletedContent extends StatelessWidget {
  const CompletedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Checkbox(
            value: false,
            activeColor: Colors.lightBlue,
            onChanged: (value) {},
          ),
          const SizedBox(
            width: 20.0,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Belajar Dart",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text("💻 Programming"),
            ],
          )
        ],
      ),
    );
  }
}
