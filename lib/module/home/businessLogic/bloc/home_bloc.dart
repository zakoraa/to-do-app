import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/model/to_do_model.dart';

part '../blocEvent/home_event.dart';
part '../blocState/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    List<ToDo> todos = [];
    on<OnAddListEventCalled>(
      (event, emit) {
        ToDo(
            id: event.id,
            title: event.title,
            description: event.description,
            createdTime: event.createdTime,
            type: event.type);
      },
    );
  }
}
