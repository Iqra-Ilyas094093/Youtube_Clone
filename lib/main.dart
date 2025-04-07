import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/pages/SplashScreen.dart';
import 'package:youtube_clone/features/auth/pages/homeScreen.dart';
import 'package:youtube_clone/features/content/longVideo/parts/video.dart';
import 'package:youtube_clone/theme/appTheme/appTheme.dart';
import 'features/pages/firstpage.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',darkTheme: AppTheme.dark,
      theme: AppTheme.light,
      home: splashScreen(),
    );
  }
}
