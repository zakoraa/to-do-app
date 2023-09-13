import 'package:flutter/material.dart';
import 'package:todoapp/shared/themes/color.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        right: 10,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: CustomColor.secondaryColor,
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }
}
