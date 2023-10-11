import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/module/home/businessLogic/bloc/to_do_bloc.dart';
import 'package:todoapp/module/home/widgets/app_bar_home.dart';
import 'package:todoapp/module/home/widgets/incomplete.dart';
import 'package:todoapp/shared/themes/color.dart';
import '../widgets/floating_button_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "My To Do List",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        state.toDoList.isEmpty
                            ? Container(
                                margin: const EdgeInsets.only(top: 30),
                                width: MediaQuery.of(context).size.width,
                                child: const Center(
                                  child: Text(
                                    "Task is empty",
                                    style: TextStyle(
                                        color: CustomColor.secondaryTextColor),
                                  ),
                                ),
                              )
                            : Column(
                                children: List.generate(
                                  state.toDoList.length,
                                  (index) {
                                    final reversedIndex =
                                        (state.toDoList.length - 1) - index;

                                    return Incomplete(
                                      toDo: state.toDoList[reversedIndex],
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
