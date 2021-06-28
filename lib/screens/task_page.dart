import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas_facu_app/bloc/tareas_bloc.dart';
import 'package:tareas_facu_app/models/task_model.dart';
import 'package:tareas_facu_app/widgets/button_add_task.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TareasBloc taskBloc = BlocProvider.of(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('Tareas'),
      ),
      drawer: Drawer(),
      body: BlocBuilder<TareasBloc, TareasState>(
        builder: (context, state) {
          return ListView.separated(
            itemCount: state.taskModel.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(
                  '$index - ${state.taskModel[index].name} ${state.taskModel[index].note}',
                ),
                onDismissed: (direction) {
                  taskBloc.add(TaskDeleteEvent(index: index));
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Se elimino: ${state.taskModel[index].name} y ${state.taskModel[index].note}',
                      ),
                    ),
                  );
                },
                background: Container(
                  color: Colors.red,
                ),
                child: Container(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 12),
                              child: Card(
                                elevation: 8.0,
                                margin: new EdgeInsets.symmetric(
                                    horizontal: 2.0, vertical: 5.0),
                                child: Container(
                                  width: 345,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(64, 75, 96, .9),
                                  ),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 0.0),
                                    title: Text(
                                      '${state.taskModel[index].name}:',
                                      style: TextStyle(
                                        decoration:
                                            state.taskModel[index].isCompleted
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 28,
                                      ),
                                    ),
                                    subtitle: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${state.taskModel[index].note}',
                                            style: TextStyle(
                                              decoration: state.taskModel[index]
                                                      .isCompleted
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: Checkbox(
                                      value: state.taskModel[index].isCompleted,
                                      onChanged: (newvalue) {
                                        taskBloc
                                            .add(TaskTickEvent(index: index));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _openDialog(context, taskBloc);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _openDialog(BuildContext context, TareasBloc taskBloc) {
    TextEditingController task = TextEditingController();
    TextEditingController notetask = TextEditingController();
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 200,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'nombre de la tarea...',
                    ),
                    controller: task,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Tarea a realizar...',
                    ),
                    controller: notetask,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ButtonAddTask(),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      taskBloc.add(
                        TaskAddEvent(
                          taskModel: TaskModel(
                            name: task.text,
                            note: notetask.text,
                            isCompleted: false,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/* Checkbox(
                                            value: state
                                                .taskModel[index].isCompleted,
                                            onChanged: (newvalue) {
                                              taskBloc.add(
                                                  TaskTickEvent(index: index));
                                            },
                                          ), */

/* Text(
                              '${state.taskModel[index].name}',
                              style: TextStyle(
                                decoration: state.taskModel[index].isCompleted
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              '${state.taskModel[index].note}',
                              style: TextStyle(
                                decoration: state.taskModel[index].isCompleted
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                            ), */
