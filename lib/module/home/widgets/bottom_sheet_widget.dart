// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/model/to_do_model.dart';
import 'package:todoapp/module/home/businessLogic/bloc/to_do_bloc.dart';
import 'package:todoapp/module/home/businessLogic/cubit/theme.dart';
import 'package:todoapp/shared/themes/color.dart';
import '../../../shared/widgets/custom_text_field.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key, this.isAddToDoList = true});

  final bool isAddToDoList;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    List<String> listType = ["📒 Tugas", "💻 Programming", "Others"];
    String dropDownValue = listType.first;
    DateTime? selectedDate;

    Future<void> _showDatePicker() async {
      final newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
      );

      if (newSelectedDate != null) {
        selectedDate = newSelectedDate.toLocal();
      }
    }

    addToDo(ToDo toDo, BuildContext context) {
      context.read<ToDoBloc>().add(AddToDo(toDo));
    }

    removeToDo(ToDo toDo, BuildContext context) {
      context.read<ToDoBloc>().add(RemoveToDo(toDo));
    }

    alterToDo(int index, BuildContext context) {
      context.read<ToDoBloc>().add(AlterToDo(index));
    }

    return SizedBox(
      height: 400,
      child: ListView(physics: const BouncingScrollPhysics(), children: [
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) => Container(
            height: 400,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Color.fromARGB(255, 20, 20, 20),
            ),
            width: MediaQuery.of(context).size.width,
            child: BlocBuilder<ToDoBloc, ToDoState>(
              builder: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 140,
                          child: Center(
                              child: Text(
                            widget.isAddToDoList
                                ? "Add Your To-Do List "
                                : "Edit Your To-Do List ",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ))),
                      const SizedBox(
                        width: 50.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  CustomTextField(
                    labelText: "List Title",
                    controller: titleController,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () async {
                        await _showDatePicker();
                      },
                      child: const Row(
                        children: [
                          Text(
                            "Choose Deadline",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Select Type : ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        DropdownButton(
                          style: const TextStyle(fontSize: 14),
                          borderRadius: BorderRadius.circular(10),
                          value: dropDownValue,
                          dropdownColor: const Color.fromARGB(255, 32, 32, 32),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                          items: listType
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropDownValue = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: OutlinedButton(
                        style: const ButtonStyle(
                          side: MaterialStatePropertyAll(BorderSide(
                              color: CustomColor.secondaryTextColor)),
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () {
                          addToDo(
                              ToDo(
                                  title: titleController.text,
                                  createdTime:
                                      selectedDate!.toLocal().toString(),
                                  type: dropDownValue),
                              context);
                          titleController.clear();
                          Navigator.pop(context);
                        },
                        child: const Center(
                          child: Text("Submit"),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
