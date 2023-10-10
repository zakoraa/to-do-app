import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerState {
  String selectedDate;

  DatePickerState({required this.selectedDate});
}

class DatePickerCubit extends Cubit<DatePickerState> {
  DatePickerCubit()
      : super(DatePickerState(
            selectedDate:
                DateFormat('dd MMMM yyyy').format(DateTime.now().toLocal())));

  Future<void> showDate(BuildContext context) async {
    final newSelectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

    if (newSelectedDate != null) {
      final formatedDate =
          DateFormat('dd MMMM yyyy').format(newSelectedDate.toLocal());
      emit(DatePickerState(selectedDate: formatedDate));
    }
  }
}
