import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.all(50),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey,
            child: Stack(
              clipBehavior: Clip.none,
              // named parameter
              // textDirection: TextDirection.rtl,

              alignment: Alignment.topLeft,

              children: [
                // using align widget
                // Align(
                //   // named parameter
                //   alignment: Alignment.topRight,
                //   child: Container(
                //     width: 100,
                //     height: 100,
                //     color: Colors.red,
                //   ),
                // ),
                // Align(
                //   // named parameter
                //   alignment: Alignment.topLeft,
                //   child: Container(
                //     width: 100,
                //     height: 100,
                //     color: Colors.green,
                //   ),
                // ),
                // Align(
                //   // named parameter
                //   alignment: Alignment.centerRight,
                //   child: Container(
                //     width: 100,
                //     height: 100,
                //     color: Colors.yellow,
                //   ),
                // ),
                // Align(
                //   // named parameter
                //   alignment: Alignment.bottomRight,
                //   child: Container(
                //     width: 100,
                //     height: 100,
                //     color: Colors.blue,
                //   ),
                // ),
                // ------------------------------------------------------------
                // using position constructor
                Positioned(
                  left: 100,
                  top: 200,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  right: 100,
                  bottom: 200,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.green,
                  ),
                ),
                Positioned(
                  top: -100,
                  left: 220,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
