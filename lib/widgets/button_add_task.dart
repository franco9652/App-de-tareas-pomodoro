import 'package:flutter/material.dart';

class ButtonAddTask extends StatelessWidget {
  const ButtonAddTask({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(
          'Añadir',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
