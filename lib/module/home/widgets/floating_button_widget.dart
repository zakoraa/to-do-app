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
          onPressed: () {
            showBottomSheet(
              context: context,
              elevation: 0,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return Container(
                  height: 500,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Color.fromARGB(255, 20, 20, 20),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 35,
                          )),
                    ],
                  ),
                );
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
