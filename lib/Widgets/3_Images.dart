import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  const Images({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          // display image from assets
          child: Image.asset(
            'images/img1.jpg',
            width: 50,
            height: 50,
            // fit: BoxFit.contain,
            // color: Colors.blue,
            // colorBlendMode: BlendMode.difference,
            // alignment: Alignment.topCenter,
            repeat: ImageRepeat.repeat,
          ),
          // display image from network
          // child: Image.network(
          //     'https://images.news18.com/ibnlive/uploads/2024/05/img-2-2024-05-14t164431.399-2024-05-a99bd629e9a6bf06ced2704c5fb5f682.jpg?impolicy=website&width=640&height=480'),
        ),
      ),
    );
  }
}
