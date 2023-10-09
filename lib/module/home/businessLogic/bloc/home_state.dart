part of 'home_bloc.dart';

enum ToDoStatus { initial, loading, success, error }

@immutable
class ToDoState extends Equatable {
  final List<ToDo> todoList;
  final ToDoStatus status;

  const ToDoState(
      {this.todoList = const <ToDo>[], this.status = ToDoStatus.initial});

  ToDoState copyWith({
    ToDoStatus? status,
    List<ToDo>? todoList,
  }) {
    return ToDoState(
        todoList: todoList ?? this.todoList, status: status ?? this.status);
  }

  @override
  factory ToDoState.fromJson(Map<String, dynamic> json) {
    try {
      var listOfTodoList = (json['todo'] as List<dynamic>)
          .map((e) => ToDo.fromJson(e as Map<String, dynamic>))
          .toList();

      return ToDoState(
          todoList: listOfTodoList,
          status: ToDoStatus.values.firstWhere(
              (element) => element.name.toString() == json["status"]));
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {"todo": todoList, "status": status.name};
  }

  @override
  List<Object?> get props => [todoList, status];
}
