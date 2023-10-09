import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/model/to_do_model.dart';
import 'package:todoapp/module/home/businessLogic/cubit/theme.dart';
import 'package:todoapp/module/home/widgets/bottom_sheet_widget.dart';
import '../../../shared/themes/color.dart';
import '../businessLogic/cubit/check_box.dart';
import 'check_box_active.dart';
import 'check_box_inactive.dart';

class Incomplete extends StatelessWidget {
  const Incomplete({super.key, required this.toDo});

  final ToDo toDo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Incomplete",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 15.0,
              ),
              BlocProvider(
                create: (context) => CheckCubit(),
                child: BlocBuilder<CheckCubit, CheckState>(
                  builder: (context, state) {
                    return GestureDetector(
                        onTap: () {
                          context.read<CheckCubit>().checkedBox();
                          if (state.isCheck) {
                            toDo.isDone = true;
                          }
                        },
                        child: state.isCheck
                            ? const CheckBoxActive()
                            : const CheckBoxInactive());
                  },
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    toDo.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
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
                    style:
                        const TextStyle(color: CustomColor.secondaryTextColor),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                                )))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
