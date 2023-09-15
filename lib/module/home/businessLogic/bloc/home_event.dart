part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class OnAddListEventCalled extends HomeEvent {
  final String id, title, description, createdTime;
  final ToDoType? type;

  const OnAddListEventCalled(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdTime,
      this.type});

  @override
  List<Object?> get props => [id, title, description, createdTime, type];
}

class OnCompletedEventCalled extends HomeEvent {
  const OnCompletedEventCalled();
  @override
  List<Object?> get props => [];
}

