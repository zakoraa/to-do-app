import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/model/to_do_model.dart';
import 'package:todoapp/module/home/businessLogic/cubit/theme.dart';
import 'package:todoapp/module/home/widgets/bottom_sheet_widget.dart';
import '../../../shared/themes/color.dart';
import '../businessLogic/bloc/to_do_bloc.dart';

class Incomplete extends StatelessWidget {
  const Incomplete({super.key, required this.toDo});

  final ToDo toDo;

  removeToDo(ToDo toDo, BuildContext context) {
    context.read<ToDoBloc>().add(RemoveToDo(toDo));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 15.0,
          ),
          GestureDetector(
              onTap: () {
                showBottomSheet(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  context: context,
                  builder: (context) =>
                      const BottomSheetWidget(isAddToDoList: false),
                );
              },
              child: BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) => Icon(
                        Icons.edit,
                        color: state.isLight
                            ? CustomColor.secondaryTextColor
                            : Colors.white,
                      ))),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                toDo.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Deadline : ${toDo.createdTime}",
                style: const TextStyle(
                    fontSize: 10, color: CustomColor.secondaryTextColor),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                toDo.type,
                style: const TextStyle(color: CustomColor.secondaryTextColor),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<ToDoBloc, ToDoState>(
                  builder: (context, state) => Material(
                    color: CustomColor.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 0.0,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  "Are you sure you have completed this task?",
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Ok'),
                                    onPressed: () {
                                      removeToDo(toDo, context);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      splashColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      child: const SizedBox(
                        height: 40,
                        width: 80,
                        child: Center(
                          child: Text(
                            "Done",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
