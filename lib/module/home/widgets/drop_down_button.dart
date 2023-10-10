import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/module/home/businessLogic/cubit/drop_down.dart';

class DropDownButtonType extends StatelessWidget {
  const DropDownButtonType({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listType = ["📒 Tugas", "💻 Programming", "Others"];
    final dropDownCubit = BlocProvider.of<DropDownCubit>(context);
    return Padding(
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
          
            BlocBuilder<DropDownCubit, DropDownState>(
              builder: (context, state) => DropdownButton(
                style: const TextStyle(fontSize: 14),
                borderRadius: BorderRadius.circular(10),
                value: state.selectedType,
                dropdownColor: const Color.fromARGB(255, 32, 32, 32),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                items: listType.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
                onChanged: (value) {
                  dropDownCubit.selectType(value);
                },
              ),
            ),
          
        ],
      ),
    );
  }
}
