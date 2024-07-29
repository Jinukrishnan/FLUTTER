import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final color;
  final textColor;
  final String? buttonText;
  final buttonTaped;

  Buttons({this.color, this.textColor, this.buttonText, this.buttonTaped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTaped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              buttonText.toString(),
              style: TextStyle(color: textColor, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
