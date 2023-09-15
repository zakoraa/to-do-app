import 'package:flutter/material.dart';
import 'package:todoapp/shared/themes/color.dart';
import 'package:intl/intl.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  static const double heightAppBar = 150;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat.yMMMd('en_US').format(dateTime);
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        height: heightAppBar,
        width: MediaQuery.of(context).size.width,
        color: CustomColor.primaryColor,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formattedDate,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "5 incomplete, 5 completed",
                style: TextStyle(
                  color: CustomColor.secondaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: CustomColor.secondaryTextColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
