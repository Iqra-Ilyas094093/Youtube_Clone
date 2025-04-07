import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:youtube_clone/features/auth/repo/googleLoginRepo.dart';
import 'package:youtube_clone/utilities/colors.dart';

class loginPage extends ConsumerWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // height: 50,
            width: 250,
            child: Image.asset(
              'assets/images/youtube-signin.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Text('Welcome to youtube', style: TextStyle(
              fontWeight: FontWeight.w500, color: kAssistingColor,fontSize: 20),),
          SizedBox(height: 40,),
          Center(child: LottieBuilder.asset(
              'assets/animations/signInAnimation.json',fit: BoxFit.cover,)),
          SizedBox(height: 60,),
          GestureDetector(
            onTap: () async {
              await ref.read(AuthServiceProvider).signinwithgoogle();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                height: 50,
                width: double.infinity,
                // color: Colors.red,
                child: Image.asset('assets/images/signinwithgoogle.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
