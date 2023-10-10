import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todoapp/module/home/businessLogic/bloc/to_do_bloc.dart';
import 'package:todoapp/module/home/businessLogic/cubit/theme.dart';
import 'package:todoapp/module/home/view/home_view.dart';
import 'package:todoapp/shared/themes/theme.dart';

import 'module/home/businessLogic/cubit/drop_down.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ToDoBloc()..add(ToDoStarted())),
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) => DropDownCubit(),
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
