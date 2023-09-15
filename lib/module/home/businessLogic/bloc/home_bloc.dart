import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/model/to_do_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    List<ToDo> todos = [];

    on<OnAddListEventCalled>(
      (event, emit) {
        ToDo newTodo = ToDo(
            id: event.title + event.createdTime,
            title: event.title,
            description: event.description,
            createdTime: event.createdTime,
            type: event.type);

        todos.add(newTodo);

        emit(AddToDoListState(toDoResult: todos));
      },
    );

    on<OnCompletedEventCalled>(((event, emit) {
      emit(CompletedToDoState(toDo: todos));
    }));
  }
}
