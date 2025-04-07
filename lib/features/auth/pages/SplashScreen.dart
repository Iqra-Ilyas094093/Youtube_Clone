import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:youtube_clone/features/auth/pages/wrapper.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: LottieBuilder.asset(
          'assets/animations/youtubeSplashAnime.json',
        ),

        splashIconSize: 300,
        nextScreen: Wrapper(),
      ),
    );
  }
}
