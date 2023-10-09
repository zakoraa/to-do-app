part of 'home_bloc.dart';

@immutable
abstract class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

class ToDoStarted extends ToDoEvent {}

class AddTodo extends ToDoEvent {
  final ToDo todo;

  const AddTodo(this.todo);

  @override
  List<Object> get props => [todo];
}

class RemoveTodo extends ToDoEvent {
  final ToDo todo;

  const RemoveTodo(this.todo);

  @override
  List<Object> get props => [todo];
}

class AlterToDo extends ToDoEvent {
  final int index;
  const AlterToDo(this.index);

  @override
  List<Object> get props => [index];
}
