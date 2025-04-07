// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatefulWidget {
  final Function(int index) onPressed;
  const BottomNavigation({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 25,left: 5,right: 5),
      child: GNav(
        rippleColor: Colors.grey[100]!,
        hoverColor: Colors.grey[100]!,
        haptic: true, // haptic feedback
        tabBorderRadius: 15, // tab button border
        duration: const Duration(milliseconds: 419),
        gap: 4,
        color: Colors.grey[700],
        activeColor: Colors.black,
        iconSize: 32,

        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        tabs: const [
          GButton(icon: Icons.home, ),
          GButton(icon: Icons.videocam, ),
          GButton(icon: Icons.add_circle),
          GButton(icon: Icons.search,),
          GButton(icon: Icons.heart_broken, ),
        ],
        onTabChange: widget.onPressed,
        selectedIndex: currentIndex,
      ),
    );
  }
}