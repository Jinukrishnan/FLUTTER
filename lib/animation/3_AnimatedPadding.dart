import 'package:flutter/material.dart';

class AnimatedPaddingWidget extends StatefulWidget {
  const AnimatedPaddingWidget({super.key});

  @override
  State<AnimatedPaddingWidget> createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {
  bool _isPaddingExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedPadding(
        padding: EdgeInsets.all(_isPaddingExpanded ? 50 : 10),
        duration: Duration(seconds: 3),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isPaddingExpanded = !_isPaddingExpanded;
          });
        },
        child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }
}
