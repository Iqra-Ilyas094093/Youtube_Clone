import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/account/accountPage.dart';
import 'package:youtube_clone/features/auth/provider/userDataProvider.dart';
import 'package:youtube_clone/features/upload/shortVideo/Widget/bottom_sheet.dart';
import 'package:youtube_clone/pagesList.dart';
import '../../content/bottom_navigation_bar.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: pages[currentIndex]),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        onPressed: (index) {
          if (index != 2) {
            currentIndex = index;
            setState(() {});
          } else {
            showModalBottomSheet(
              context: context,
              builder: (context) => CreateBottomSheet(),
            );
          }
        },
      ),
    );
  }
}
