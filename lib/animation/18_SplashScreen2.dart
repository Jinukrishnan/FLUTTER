import 'package:flutter/material.dart';

class SpalshScreen2 extends StatefulWidget {
  const SpalshScreen2({super.key});

  @override
  State<SpalshScreen2> createState() => _SpalshScreen2State();
}

class _SpalshScreen2State extends State<SpalshScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text(
          'This is the Home Screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
