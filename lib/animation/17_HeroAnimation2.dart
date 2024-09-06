import 'package:flutter/material.dart';

class HeroAnimationExample2 extends StatefulWidget {
  const HeroAnimationExample2({super.key});

  @override
  State<HeroAnimationExample2> createState() => _HeroAnimationExample2State();
}

class _HeroAnimationExample2State extends State<HeroAnimationExample2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full-Screen Image'),
      ),
      body: Center(
        child: Hero(
          tag: 'hero-image', // The same tag as in the first screen
          child: Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            width: 300.0,
            height: 300.0,
          ),
        ),
      ),
    );
  }
}
