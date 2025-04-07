import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/features/auth/pages/homeScreen.dart';
import 'package:youtube_clone/features/auth/pages/loginPage.dart';
import 'package:youtube_clone/features/auth/pages/usernamePage.dart';
import 'package:youtube_clone/features/channel/my_channel/pages/channelSettings.dart';
import 'package:youtube_clone/features/channel/my_channel/pages/my_channel.dart';
import 'package:youtube_clone/features/channel/user_channel/pages/userChannelPage.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error Occured'));
          }
          else if(!snapshot.hasData){
            return loginPage();
          }
          return StreamBuilder(
            stream:
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || !snapshot.data!.exists) {
                final user = FirebaseAuth.instance.currentUser;
                return userNamePage(
                  email: user!.email!,
                  displayName: user.displayName!,
                  profilePic: user.photoURL!,
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              else{
                return homeScreen();
              }
            },
          );
        },
      ),
    );
  }
}
