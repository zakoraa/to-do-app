import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:todoapp/model/to_do_model.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends HydratedBloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(const ToDoState()) {
    on<ToDoStarted>(_onStarted);
    on<AddToDo>(_onAddToDo);
    on<RemoveToDo>(_onRemoveToDo);
    on<AlterToDo>(_onAlterToDo);
  }

  void _onStarted(
    ToDoStarted event,
    Emitter<ToDoState> emit,
  ) {
    if (state.status == ToDoStatus.success) return;
    emit(state.copyWith(toDoList: state.toDoList, status: ToDoStatus.success));
  }

  void _onAddToDo(
    AddToDo event,
    Emitter<ToDoState> emit,
  ) {
    emit(state.copyWith(status: ToDoStatus.loading));
    try {
      List<ToDo> temp = [];
      temp.addAll(state.toDoList);
      temp.insert(0, event.toDo);
      emit(state.copyWith(toDoList: temp, status: ToDoStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ToDoStatus.error));
    }
  }

  void _onRemoveToDo(
    RemoveToDo event,
    Emitter<ToDoState> emit,
  ) {
    emit(state.copyWith(status: ToDoStatus.loading));
    try {
      state.toDoList.remove(event.toDo);
      emit(
          state.copyWith(toDoList: state.toDoList, status: ToDoStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ToDoStatus.error));
    }
  }

  void _onAlterToDo(
    AlterToDo event,
    Emitter<ToDoState> emit,
  ) {
    emit(state.copyWith(status: ToDoStatus.loading));
    try {
      state.toDoList[event.index].isDone == !state.toDoList[event.index].isDone;
      emit(
          state.copyWith(toDoList: state.toDoList, status: ToDoStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ToDoStatus.error));
    }
  }

  @override
  ToDoState? fromJson(Map<String, dynamic> json) {
    return ToDoState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ToDoState state) {
    return state.toJson();
  }
}
