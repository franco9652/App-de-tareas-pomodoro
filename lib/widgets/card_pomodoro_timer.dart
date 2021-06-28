import 'package:flutter/material.dart';

class PomodoroCard extends StatelessWidget {
  const PomodoroCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 210,
      decoration: BoxDecoration(
        color: Colors.amberAccent[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 3),
            child: Icon(Icons.timer, size: 60, color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Pomodoro Timer',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 25,
                  fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
