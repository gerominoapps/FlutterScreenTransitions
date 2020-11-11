import 'package:flutter/material.dart';

class NextScreenButton extends StatelessWidget {

  final Function onNextScreenIsPressed;

  NextScreenButton({this.onNextScreenIsPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      splashColor: Colors.lightBlueAccent,
      elevation: 6,
      padding: EdgeInsets.all(20),
      color: Theme.of(context).primaryColor,
      onPressed: onNextScreenIsPressed, child: Text('Next Screen Please', style: TextStyle(color: Colors.white, fontSize: 18.0),));
  }
}
