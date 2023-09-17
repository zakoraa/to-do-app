import 'package:flutter/material.dart';

import '../../../shared/widgets/custom_text_field.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key, this.isAddToDoList = true});

  final bool isAddToDoList;

  @override
  Widget build(BuildContext context) {
    List<String> listType = ["📒 Tugas", "💻 Programming", "Others"];
    String dropDownValue = listType.first;

    return SizedBox(
      height: isAddToDoList ? 500 : 400,
      child: ListView(physics: const BouncingScrollPhysics(), children: [
        Container(
          height: isAddToDoList ? 500 : 400,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Color.fromARGB(255, 20, 20, 20),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(250, 14, 14, 14)),
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 40,
                        ),
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Center(
                          child: Text(
                        isAddToDoList
                            ? "Add Your To-Do List "
                            : "Edit Your To-Do List ",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ))),
                  const SizedBox(
                    width: 50.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              const CustomTextField(labelText: "List Title"),
              const SizedBox(
                height: 30.0,
              ),
              const CustomTextField(labelText: "List Description"),
              const SizedBox(
                height: 30.0,
              ),
              isAddToDoList
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Select Type : ",
                            style: TextStyle(fontSize: 14),
                          ),
                          DropdownButton(
                            style: const TextStyle(fontSize: 14),
                            borderRadius: BorderRadius.circular(10),
                            value: dropDownValue,
                            items: listType
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              isAddToDoList
                  ? const SizedBox(
                      height: 20.0,
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton(
                    style: const ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () {},
                    child: const Center(
                      child: Text("Submit"),
                    )),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
