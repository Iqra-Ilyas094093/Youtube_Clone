import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/features/account/items.dart';
import 'package:youtube_clone/features/auth/model/usermodel.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/topHeader.dart';

import '../../utilities/colors.dart';

class accountPage extends StatelessWidget {
  final userModel user;
  const accountPage({super.key, required this.user,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: CachedNetworkImageProvider(user.profilePic),
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              user.displayName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kAssistingColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 30),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey.shade600),
                children: [
                  TextSpan(text: '  ${user.email} '),
                  TextSpan(text: '  ${user.subscriptions.length} Subscriptions '),
                  TextSpan(text: '  ${user.videos} Videos '),
                ],
              ),
            ),
          ),
          Items(),
        ],
      ),
    );
  }
}
