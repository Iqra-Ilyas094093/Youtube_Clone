import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_clone/view/screens/screens.dart';
import 'package:youtube_clone/view/screens/search_screen.dart';
import 'package:youtube_clone/view_model/search_provider.dart';

void main() async{

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>SearchProvider()),
      ],
      child: MaterialApp(
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
        home: Navigation(),
      ),
    );
  }
}
