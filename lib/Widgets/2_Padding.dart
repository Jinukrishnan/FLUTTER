import 'package:flutter/material.dart';

class Paddings extends StatelessWidget {
  const Paddings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Padding
        body: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Text("hai"),
        ),
      ),
    );
  }
}
