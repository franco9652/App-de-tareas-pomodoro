import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tareas_facu_app/models/task_model.dart';

part 'tareas_event.dart';
part 'tareas_state.dart';

class TareasBloc extends Bloc<TareasEvent, TareasState> {
  TareasBloc() : super(TareasState());

  @override
  Stream<TareasState> mapEventToState(
    TareasEvent event,
  ) async* {
    if (event is TaskAddEvent) {
      final List<TaskModel> newTaskItems = List.from(state.taskModel)
        ..add(
          TaskModel(
            name: event.taskModel.name,
            note: event.taskModel.note,
            isCompleted: event.taskModel.isCompleted,
          ),
        );
      yield TareasState(taskModel: newTaskItems);
    } else if (event is TaskTickEvent) {
      List<TaskModel> newTaskModel = List.from(state.taskModel);
      newTaskModel[event.index] = TaskModel(
        name: state.taskModel[event.index].name,
        note: state.taskModel[event.index].note,
        isCompleted: !state.taskModel[event.index].isCompleted,
      );
      yield TareasState(taskModel: newTaskModel);
    } else if (event is TaskDeleteEvent) {
      final List<TaskModel> newTaskItem = List.from(state.taskModel);
      newTaskItem.removeAt(event.index);
      yield TareasState(taskModel: newTaskItem);
    }
  }
}

/* newTaskModel[event.index] = TaskModel(
        name: state.taskModel[event.index].name,
        note: state.taskModel[event.index].note,
        isCompleted: !state.taskModel[event.index].isCompleted,
      ); */
