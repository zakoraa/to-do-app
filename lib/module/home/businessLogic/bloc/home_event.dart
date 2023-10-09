part of 'home_bloc.dart';

@immutable
abstract class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

class ToDoStarted extends ToDoEvent {}

class AddToDo extends ToDoEvent {
  final ToDo toDo;

  const AddToDo(this.toDo);

  @override
  List<Object> get props => [toDo];
}

class RemoveToDo extends ToDoEvent {
  final ToDo toDo;

  const RemoveToDo(this.toDo);

  @override
  List<Object> get props => [toDo];
}

class AlterToDo extends ToDoEvent {
  final int index;
  const AlterToDo(this.index);

  @override
  List<Object> get props => [index];
}
