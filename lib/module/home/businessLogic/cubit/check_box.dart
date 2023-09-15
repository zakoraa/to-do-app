import 'package:bloc/bloc.dart';

class CheckState {
  final bool isCheck;

  CheckState({required this.isCheck});
}

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(CheckState(isCheck: false));

  void checkedBox()=>emit(CheckState(isCheck: !state.isCheck));
}
