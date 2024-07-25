import 'package:flutter/material.dart';

class DarkNeumorphism extends StatelessWidget {
  const DarkNeumorphism({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            child: Icon(
              Icons.android,
              size: 80,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              // color: Colors.green,
              color: Colors.grey[900],
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(5, 5),
                    blurRadius: 15,
                    spreadRadius: 1),
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(-5, -5),
                    blurRadius: 15,
                    spreadRadius: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
