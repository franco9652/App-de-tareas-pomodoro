part of 'tareas_bloc.dart';

class TareasState extends Equatable {
  final List<TaskModel> taskModel;

  TareasState({this.taskModel = const []});

  @override
  List<Object> get props => [taskModel];

  @override
  String toString() => 'Task: ${taskModel.length}';
}
