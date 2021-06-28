import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas_facu_app/bloc/tareas_bloc.dart';
import 'package:tareas_facu_app/screens/home_page.dart';
import 'package:tareas_facu_app/screens/task_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TareasBloc>(
          create: (context) => TareasBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'home_page',
        routes: {
          'home_page': (_) => HomePage(),
          'task_home': (_) => TaskPage(),
        },
      ),
    );
  }
}
