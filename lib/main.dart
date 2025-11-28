import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/view/screens/channel/channel_details_about.dart';
import 'package:youtube_clone/view/screens/channel/channel_details_community.dart';
import 'package:youtube_clone/view/screens/channel/channel_details_main.dart';
import 'package:youtube_clone/view/screens/channel/channel_details_playlist.dart';
import 'package:youtube_clone/view/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_clone/view/screens/library_screen.dart';
import 'package:youtube_clone/view/screens/notification_screen.dart';
import 'package:youtube_clone/view/screens/screens.dart';
import 'package:youtube_clone/view/screens/search/search_result_channel.dart';
import 'package:youtube_clone/view/screens/search/search_result_shorts.dart';
import 'package:youtube_clone/view/screens/search/search_result_videos.dart';
import 'package:youtube_clone/view/screens/search_screen.dart';
import 'package:youtube_clone/view/screens/sign_in_screen.dart';
import 'package:youtube_clone/view/screens/video_player_screen.dart';

void main() async{

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YT Clone',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF20D0D),
          brightness: Brightness.light,
        ),
        fontFamily: 'Spline Sans',
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF20D0D),
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.splineSansTextTheme(),
      ),
      home: ChannelDetailsScreen(),
    );
  }
}
