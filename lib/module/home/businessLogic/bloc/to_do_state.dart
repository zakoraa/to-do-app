part of 'to_do_bloc.dart';

enum ToDoStatus { initial, loading, success, error }

@immutable
class ToDoState extends Equatable {
  final List<ToDo> toDoList;
  final ToDoStatus status;

  const ToDoState(
      {this.toDoList = const <ToDo>[], this.status = ToDoStatus.initial});

  ToDoState copyWith({
    ToDoStatus? status,
    List<ToDo>? toDoList,
  }) {
    return ToDoState(
        toDoList: toDoList ?? this.toDoList, status: status ?? this.status);
  }

  @override
  factory ToDoState.fromJson(Map<String, dynamic> json) {
    try {
      var listOfToDoList = (json["todo"] as List<dynamic>)
          .map((e) => ToDo.fromJson(e as Map<String, dynamic>))
          .toList();

      return ToDoState(
          toDoList: listOfToDoList,
          status: ToDoStatus.values.firstWhere(
              (element) => element.name.toString() == json["status"]));
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {"todo": toDoList, "status": status.name};
  }

  @override
  List<Object?> get props => [toDoList, status];
}
