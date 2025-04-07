import 'package:flutter/material.dart';
import '../../cores/widgets/imageItem.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 35,
            // your-channel.png Your Channel
            child: ImageItem(
              itemText: 'your-channel.png',
              itemClicked: () {},
              imageName: 'your-channel.png',
              haveColor: false,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 34,
            // your-channel.png Turn on Incognito
            child: ImageItem(
              itemText: 'Turn on Incognito',
              itemClicked: () {},
              imageName: 'your-channel.png',
              haveColor: false,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 34,
            // cast.png Add Account
            child: ImageItem(
              itemText: 'Add Account',
              itemClicked: () {},
              imageName: 'cast.png',
              haveColor: false,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 6, bottom: 6),
            child: Divider(color: Colors.blueGrey),
          ),
          SizedBox(
            height: 35,
            // purchases.png Purchases and Membership
            child: ImageItem(
              itemText: 'Purchases and Membership',
              itemClicked: () {},
              imageName: 'purchases.png',
              haveColor: false,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 31,
            // time-watched.png Time watched
            child: ImageItem(
              itemText: 'Time watched',
              itemClicked: () {},
              imageName: 'time-watched.png',
              haveColor: false,
            ),
          ),
          const SizedBox(height: 7),
          SizedBox(
            height: 31,
            // your-data.png Your data in Youtube
            child: ImageItem(
              itemText: 'Your data in Youtube',
              itemClicked: () {},
              imageName: 'your-data.png',
              haveColor: false,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 6, bottom: 6),
            child: Divider(color: Colors.blueGrey),
          ),
          SizedBox(
            height: 33,
            // settings.png Settings
            child: ImageItem(
              itemText: 'Settings',
              itemClicked: () {},
              imageName: 'settings.png',
              haveColor: false,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 35,
            // help.png Help & feedback
            child: ImageItem(
              itemText: 'Help & feedback',
              itemClicked: () {},
              imageName: 'help.png',
              haveColor: false,
            ),
          ),
        ],
      ),
    );
  }
}
