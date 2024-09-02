import 'package:flutter/material.dart';

class AnimatedCrossFacdeWidget extends StatefulWidget {
  const AnimatedCrossFacdeWidget({super.key});

  @override
  State<AnimatedCrossFacdeWidget> createState() =>
      _AnimatedCrossFacdeWidgetState();
}

class _AnimatedCrossFacdeWidgetState extends State<AnimatedCrossFacdeWidget> {
  bool _isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedCrossFade(
          firstChild: IconButton(
              onPressed: () {
                setState(() {
                  _isShow = true;
                });
              },
              icon: Icon(Icons.play_arrow)),
          secondChild: IconButton(
              onPressed: () {
                setState(() {
                  _isShow = false;
                });
              },
              icon: Icon(Icons.pause)),
          crossFadeState:
              _isShow ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: Duration(seconds: 1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isShow = !_isShow;
          });
        },
        child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }
}
