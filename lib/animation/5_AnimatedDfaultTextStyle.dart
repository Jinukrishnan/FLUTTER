import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  const AnimatedDefaultTextStyleWidget({super.key});

  @override
  State<AnimatedDefaultTextStyleWidget> createState() =>
      _AnimatedDefaultTextStyleWidgetState();
}

class _AnimatedDefaultTextStyleWidgetState
    extends State<AnimatedDefaultTextStyleWidget> {
  bool _siTextStyleExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedDefaultTextStyle(
        style: TextStyle(
            fontSize: _siTextStyleExpanded ? 24 : 12,
            fontWeight:
                _siTextStyleExpanded ? FontWeight.bold : FontWeight.normal,
            color: Colors.black),
        duration: Duration(milliseconds: 500),
        child: Center(child: Text("Synnefo Solutions")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _siTextStyleExpanded = !_siTextStyleExpanded;
          });
        },
        child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }
}
