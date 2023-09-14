part of '../bloc/home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class OnAddListEventCalled extends HomeEvent {
  final int id;
  final String title, description, createdTime;
  final ToDoType? type;

  const OnAddListEventCalled(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdTime,
      this.type});
  
  @override
  List<Object?> get props => [title, description, createdTime, type];
}
