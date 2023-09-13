import 'package:flutter/material.dart';
import 'package:todoapp/shared/themes/color.dart';

class IncompleteContent extends StatelessWidget {
  const IncompleteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          const SizedBox(
            width: 20.0,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tugas Akhir PBO",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "📒 Tugas",
                style: TextStyle(color: CustomColor.secondaryColor),
              )
            ],
          ),
        ],
      ),
    );
  }
}
