part of '../bloc/home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class AddToDoListState extends HomeState {
  final List<ToDo> toDoResult;

  const AddToDoListState({required this.toDoResult});
  @override
  List<Object> get props => [toDoResult];
}
