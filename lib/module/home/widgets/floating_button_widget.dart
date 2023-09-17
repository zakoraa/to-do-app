import 'package:flutter/material.dart';
import 'package:todoapp/module/home/widgets/bottom_sheet_widget.dart';
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
          onPressed: () {
            showBottomSheet(
              context: context,
              elevation: 0,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return const BottomSheetWidget();
              },
            );
          },
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
