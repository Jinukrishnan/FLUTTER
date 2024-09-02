import 'package:flutter/material.dart';

class AnimatedScaleWidget extends StatefulWidget {
  const AnimatedScaleWidget({super.key});

  @override
  State<AnimatedScaleWidget> createState() => _AnimatedScaleWidgetState();
}

class _AnimatedScaleWidgetState extends State<AnimatedScaleWidget> {
  bool _isScale = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedScale(
          scale: _isScale ? 1.5 : 1,
          duration: Duration(milliseconds: 500),
          child: Container(
            color: Colors.blue,
            width: 100,
            height: 100,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isScale = !_isScale;
          });
        },
        child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }
}
