import 'package:flutter/material.dart';

class FadeTransitionExample extends StatefulWidget {
  const FadeTransitionExample({super.key});

  @override
  State<FadeTransitionExample> createState() => _FadeTransitionExampleState();
}

class _FadeTransitionExampleState extends State<FadeTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 500),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Size Transition"),
      ),
      body: Center(
        child: Column(
          children: [
            FadeTransition(
              opacity: _controller,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
            // ScaleTransition(
            //   scale: _controller,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.green,
            //   ),
            // ),

            // RotationTransition(
            //   turns: _controller,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.green,
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isDismissed) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
