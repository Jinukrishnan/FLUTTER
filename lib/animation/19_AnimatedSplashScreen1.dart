import 'package:animation/animation/19_AnimatedSplashScreen2.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class AnimatedSpalshScreen1 extends StatelessWidget {
  const AnimatedSpalshScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      animationDuration: Duration(seconds: 5),
      splash: Column(
        children: [
          Center(
            // child: Icon(Icons.add),
            child: LottieBuilder.asset("assets/Lottie/Animation.json"),
          )
        ],
      ),
      nextScreen: AnimatedSplashScreen2(),
      backgroundColor: Colors.green,
      splashIconSize: 200,
    );
  }
}
