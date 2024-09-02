import 'package:flutter/material.dart';

class AnimatedOppacityWidget extends StatefulWidget {
  const AnimatedOppacityWidget({super.key});

  @override
  State<AnimatedOppacityWidget> createState() => _AnimatedOppacityWidgetState();
}

class _AnimatedOppacityWidgetState extends State<AnimatedOppacityWidget> {
  bool _isOppacity = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _isOppacity ? 1 : 0,
        
        duration: Duration(seconds: 1),
        child: Center(
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isOppacity = !_isOppacity;
          });
        },
        child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }
}
