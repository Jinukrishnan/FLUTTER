import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  VoidCallback onPressed;
  final String text;

  MyButtons({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.yellow,
      child: Text(text.toString()),
    );
  }
}
