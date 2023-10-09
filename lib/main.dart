import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/module/home/businessLogic/bloc/home_bloc.dart';
import 'package:todoapp/module/home/businessLogic/cubit/theme.dart';
import 'package:todoapp/module/home/view/home_view.dart';
import 'package:todoapp/shared/themes/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ToDoBloc()),
          BlocProvider(
            create: (context) => ThemeCubit(),
          )
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                state.isLight ? CustomTheme.lightTheme : CustomTheme.darkTheme,
            home: const HomeView(),
          ),
        ));
  }
}
