import 'package:flutter/material.dart';

class tabContent extends StatelessWidget {
  const tabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(children: [
        Center(child: Text('Home')),
        Center(child: Text('Videos')),
        Center(child: Text('Shorts')),
        Center(child: Text('Playlist')),
        Center(child: Text('Channel')),
        Center(child: Text('Community')),
        Center(child: Text('About')),
      ]),
    );
  }
}
