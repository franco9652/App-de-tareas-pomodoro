import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String name;
  final String note;
  final bool isCompleted;

  TaskModel({
    this.name,
    this.note,
    this.isCompleted,
  });

  @override
  List<Object> get props => [name, note, isCompleted];
}
