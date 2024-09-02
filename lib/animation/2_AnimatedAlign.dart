import 'package:flutter/material.dart';

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget({super.key});

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  double width = 100;
  double height = 100;
  Alignment align = Alignment.topLeft;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedAlign(
        alignment: align,
        duration: Duration(seconds: 5),
        child: AnimatedContainer(
          duration: Duration(seconds: 5),
          width: width,
          height: height,
          color: Colors.green,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            width += 100;
            height += 100;
            align = Alignment.center;
          });
        },
        child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }
}
