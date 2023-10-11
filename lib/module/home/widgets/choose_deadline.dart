import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/themes/color.dart';
import '../businessLogic/cubit/date_picker.dart';

class ChooseDeadline extends StatelessWidget {
  const ChooseDeadline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatePickerCubit, DatePickerState>(
        builder: (context, state) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await context.read<DatePickerCubit>().showDate(context);
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
                        ),
                      ],
                    ),
                  ),
                  Text(
                    state.selectedDate,
                    style:
                        const TextStyle(color: CustomColor.secondaryTextColor),
                  ),
                ],
              ),
            ));
  }
}
