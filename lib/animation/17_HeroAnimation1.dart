import 'package:flutter/material.dart';

class HeroAnimationExample1 extends StatefulWidget {
  const HeroAnimationExample1({super.key});

  @override
  State<HeroAnimationExample1> createState() => _HeroAnimationExample1State();
}

class _HeroAnimationExample1State extends State<HeroAnimationExample1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Hero Animation"),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/hero2");
          },
          child: Hero(
              tag: 'hero-image',
              child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                width: 100,
                height: 100,
              )),
        ),
      ),
    );
  }
}
