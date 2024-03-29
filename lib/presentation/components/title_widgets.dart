import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget
({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("todo list", 
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.blueAccent,
      fontSize: 80,
      fontWeight: FontWeight.w100,
    ),);
  }
}