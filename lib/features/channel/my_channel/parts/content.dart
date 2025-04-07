import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utilities/colors.dart';

class contentColumn extends StatelessWidget {
  const contentColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: TabBar(
        labelColor: kAssistingColor,
        labelStyle: TextStyle(
            color: kAssistingColor,
            fontWeight: FontWeight.w500,
            fontSize: 15
        ),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: kAssistingColor,
        indicatorPadding: EdgeInsets.only(top: 12),
        tabs: [
          Text('Home'),
          Text('Videos'),
          Text('Shorts'),
          Text('Playlist'),
          Text('Channel'),
          Text('Community'),
          Text('About'),
        ],
      ),
    );
  }
}
