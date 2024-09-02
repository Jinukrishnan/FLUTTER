import 'package:flutter/material.dart';

class AnimatedIconWidget extends StatefulWidget {
  const AnimatedIconWidget({super.key});

  @override
  State<AnimatedIconWidget> createState() => _AnimatedIconWidgetState();
}

// edited here SingleTickerProviderStateMixin
class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isFav = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimatedIcon(
              icon:
                  _isFav ? AnimatedIcons.play_pause : AnimatedIcons.pause_play,
              progress: _animationController)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isFav = !_isFav;
            _animationController.forward(from: 0);
          });
        },
        child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }
}
