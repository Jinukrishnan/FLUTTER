import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                color: Colors.deepPurple,
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
