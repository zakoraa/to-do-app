import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/module/home/businessLogic/cubit/theme.dart';

import '../../../shared/themes/color.dart';

class CheckBoxInactive extends StatelessWidget {
  const CheckBoxInactive({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) => Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: state.isLight
              ? const Color.fromARGB(255, 180, 180, 180)
              : CustomColor.secondaryTextColor,
        ),
      ),
    );
  }
}
