import 'package:flutter/material.dart';

class AnimatedRottationWidget extends StatefulWidget {
  const AnimatedRottationWidget({super.key});

  @override
  State<AnimatedRottationWidget> createState() =>
      _AnimatedRottationWidgetState();
}

class _AnimatedRottationWidgetState extends State<AnimatedRottationWidget> {
  bool _isRotating = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedRotation(
          turns: _isRotating ? 1 : 0,
          duration: Duration(seconds: 3),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Text("Animated Rotation"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isRotating = !_isRotating;
          });
        },
        child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }
}
