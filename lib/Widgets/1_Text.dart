import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  const Texts({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Text(
          "Synnefo solutions PVT LTD",
          style: TextStyle(
            // attach google font
            fontFamily: 'Edu',
            color: Colors.green,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            wordSpacing: 5,
            height: 1.5,
            backgroundColor: Colors.yellow,
            decoration: TextDecoration.underline,
            decorationColor: Colors.red,
            decorationStyle: TextDecorationStyle.dashed,
          ),
          // align
          // textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}
