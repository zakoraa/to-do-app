import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/module/home/businessLogic/cubit/check_box.dart';
import 'package:todoapp/module/home/widgets/check_box_active.dart';
import 'package:todoapp/module/home/widgets/check_box_inactive.dart';
import 'package:todoapp/shared/themes/color.dart';

class IncompleteContent extends StatelessWidget {
  const IncompleteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                "Deadline : Sep 15, 2023",
                style: TextStyle(
                    fontSize: 10, color: CustomColor.secondaryTextColor),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "📒 Tugas",
                style: TextStyle(color: CustomColor.secondaryTextColor),
              ),
            ],
          ),
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Icon(Icons.edit)],
            ),
          ),
        ],
      ),
    );
  }
}
