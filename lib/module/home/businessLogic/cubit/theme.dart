import 'package:bloc/bloc.dart';

class ThemeState {
  final bool isLight;

  ThemeState({required this.isLight});
}

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isLight: false));

  void changeTheme() => emit(ThemeState(isLight: !state.isLight));
}
