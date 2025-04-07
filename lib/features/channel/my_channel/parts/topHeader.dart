import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/features/auth/model/usermodel.dart';

import '../../../../utilities/colors.dart';

class topHeader extends StatelessWidget {
  final userModel user;

  const topHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: CachedNetworkImageProvider(user.profilePic),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
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
          padding: const EdgeInsets.only(top: 8.0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.grey.shade600),
              children: [
                TextSpan(text: '${user.email}  '),
                TextSpan(text: '${user.subscriptions.length} Subscriptions  '),
                TextSpan(text: '${user.videos} Videos '),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 8),
          child: Text('More about this channel'),
        ),
      ],
    );
  }
}
