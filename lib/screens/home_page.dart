import 'package:flutter/material.dart';
import 'package:tareas_facu_app/screens/pomodoro_page.dart';
import 'package:tareas_facu_app/screens/task_page.dart';
import 'package:tareas_facu_app/widgets/card_pomodoro_timer.dart';
import 'package:tareas_facu_app/widgets/card_task_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('SoyProductivoApp'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 87, top: 50),
            child: InkWell(
              child: PomodoroCard(),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PomodoroPage()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 85, top: 30),
            child: InkWell(
              child: CardTaskButton(),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TaskPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
