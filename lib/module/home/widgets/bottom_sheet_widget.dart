// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/model/to_do_model.dart';
import 'package:todoapp/module/home/businessLogic/bloc/to_do_bloc.dart';
import 'package:todoapp/module/home/businessLogic/cubit/date_picker.dart';
import 'package:todoapp/module/home/businessLogic/cubit/drop_down.dart';
import 'package:todoapp/module/home/businessLogic/cubit/theme.dart';
import 'package:todoapp/module/home/widgets/choose_deadline.dart';
import 'package:todoapp/module/home/widgets/drop_down_button.dart';
import 'package:todoapp/shared/themes/color.dart';
import 'package:todoapp/shared/utils/scaffold_messenger.dart';
import '../../../shared/widgets/custom_text_field.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key, this.isAddToDoList = true});

  final bool isAddToDoList;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    String selectedDate =
        DateFormat('dd MMMM yyyy').format(DateTime.now().toLocal());
    String today = selectedDate;

    Future<void> _showDatePicker() async {
      final newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
      );

      if (newSelectedDate != null) {
        final formatedDate =
            DateFormat('dd MMMM yyyy').format(newSelectedDate.toLocal());
        selectedDate = formatedDate;
      }
    }

    addToDo(ToDo toDo, BuildContext context) {
      context.read<ToDoBloc>().add(AddToDo(toDo));
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Color.fromARGB(255, 20, 20, 20),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: BlocBuilder<ToDoBloc, ToDoState>(
                    builder: (context, state) =>
                        BlocBuilder<DatePickerCubit, DatePickerState>(
                      builder: (context, datePickerState) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  datePickerState.selectedDate = today;
                                  Navigator.pop(context);
                                },
                                child: const SizedBox(
                                  width: 50,
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                              Text(
                                isAddToDoList
                                    ? "Add Your To-Do List "
                                    : "Edit Your To-Do List ",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
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
                          const ChooseDeadline(),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const DropDownButtonType(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          BlocBuilder<DropDownCubit, DropDownState>(
                            builder: (context, state) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: OutlinedButton(
                                  style: const ButtonStyle(
                                    side: MaterialStatePropertyAll(BorderSide(
                                        color: CustomColor.secondaryTextColor)),
                                    splashFactory: NoSplash.splashFactory,
                                  ),
                                  onPressed: () {
                                    if (titleController.text.isNotEmpty) {
                                      addToDo(
                                          ToDo(
                                              title: titleController.text,
                                              createdTime:
                                                  datePickerState.selectedDate,
                                              type: state.selectedType),
                                          context);
                                      titleController.clear();
                                      datePickerState.selectedDate = today;
                                      Navigator.pop(context);
                                      ScaffoldMessengerUtils
                                          .showSuccessedFloatingSnackBar(context,
                                              "Successfully added Task");
                                    } else {
                                      ScaffoldMessengerUtils
                                          .showFailedFloatingSnackBar(context,
                                              "Please fill in the title!");
                                    }
                                  },
                                  child: const Center(
                                    child: Text("Submit"),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
      ]),
    );
  }
}
