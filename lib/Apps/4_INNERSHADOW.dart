import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InnerShadow extends StatelessWidget {
  const InnerShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            child: Icon(
              Icons.android,
              size: 50,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(5, 5),
                    blurRadius: 15,
                    spreadRadius: 1),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, -5),
                    blurRadius: 15,
                    spreadRadius: 1),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black12,
                    Colors.black26,
                    Colors.black38,
                  ],
                  stops: [
                    0.2,
                    0.4,
                    .8
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
