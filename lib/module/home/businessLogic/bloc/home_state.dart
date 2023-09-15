part of 'home_bloc.dart';

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

class IncompletedToDoState extends HomeState {
  @override
  List<Object> get props => [];
}

class CompletedToDoState extends HomeState {
  final List<ToDo> toDo;
  const CompletedToDoState({required this.toDo});
  @override
  List<Object?> get props => [toDo];
}
