import 'package:bloc/bloc.dart';

class DropDownState {
  String selectedType;

  DropDownState({required this.selectedType});
}

class DropDownCubit extends Cubit<DropDownState> {
  DropDownCubit() : super(DropDownState(selectedType: "📒 Tugas"));

  void selectType(String? value) {
    emit(DropDownState(selectedType: value!));
  }
}
