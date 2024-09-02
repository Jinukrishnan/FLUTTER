import 'package:flutter/material.dart';

class AnimatedControllerWidget extends StatefulWidget {
  const AnimatedControllerWidget({super.key});

  @override
  State<AnimatedControllerWidget> createState() =>
      _AnimatedControllerWidgetState();
}

class _AnimatedControllerWidgetState extends State<AnimatedControllerWidget> {
  double width = double.infinity;
  double height = 0;
  Color color = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 5),
        width: width,
        height: height,
        color: color,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // width += 100;
            height += 600;
            color = Colors.red;
          });
        },
        child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }
}
