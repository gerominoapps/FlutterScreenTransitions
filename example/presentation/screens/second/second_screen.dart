import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen2'),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.amberAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Screen 2',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
