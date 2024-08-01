import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      // blurStyle: BlurStyle.outer,
                      blurRadius: 5,
                      offset: Offset(5, 5),
                    ),
                    BoxShadow(
                      color: Colors.white24,
                      // blurStyle: BlurStyle.outer,
                      blurRadius: 5,
                      offset: Offset(-5, -5),
                    ),
                  ]),
              child: Image.asset(
                'lib/icons/1.png',
                width: 50,
                color: Colors.yellow,
              )),
        ),
      ),
    );
  }
}
