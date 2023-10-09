import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/module/home/businessLogic/bloc/home_bloc.dart';
import 'package:todoapp/module/home/widgets/app_bar_home.dart';
import 'package:todoapp/module/home/widgets/incomplete.dart';

import '../../../model/to_do_model.dart';
import '../widgets/floating_button_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  addToDo(ToDo toDo, BuildContext context) {
    context.read<ToDoBloc>().add(AddToDo(toDo));
  }

  removeToDo(ToDo toDo, BuildContext context) {
    context.read<ToDoBloc>().add(RemoveToDo(toDo));
  }

  alterToDo(int index, BuildContext context) {
    context.read<ToDoBloc>().add(AlterToDo(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child:
                    BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
                  if (state.status == ToDoStatus.success) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: HomeAppBar.heightAppBar + 20),
                        Column(
                          children: List.generate(
                            state.toDoList.length,
                            (index) {
                              state.toDoList[index].title;
                              return Incomplete(
                                toDo: state.toDoList[index],
                              );
                            },
                          ),
                        )
                      ],
                    );
                  } else if (state.status == ToDoStatus.initial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container();
                  }
                })),
            const HomeAppBar(),
            const FloatingButtonWidget()
          ],
        ),
      ),
    ));
  }
}
