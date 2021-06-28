part of 'tareas_bloc.dart';

abstract class TareasEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TaskAddEvent extends TareasEvent {
  final TaskModel taskModel;

  TaskAddEvent({this.taskModel});

  @override
  List<Object> get props => [taskModel];
}

class TaskTickEvent extends TareasEvent {
  final int index;

  TaskTickEvent({@required this.index});
  @override
  List<Object> get props => [index];
}

class TaskDeleteEvent extends TareasEvent {
  final int index;

  TaskDeleteEvent({@required this.index});
  @override
  List<Object> get props => [index];
}
