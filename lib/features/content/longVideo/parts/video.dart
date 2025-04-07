// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:youtube_clone/features/pages/firstpage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../cores/colors/colors.dart';
import '../widgets/video_external_button.dart';

class Video extends StatefulWidget {
  final String videoLink;
  final String title;
  final String profilePic;
  final String time;
  final String Subscriptions;
  final String views;
  final String ChannelName;

  Video({
    Key? key,
    required this.videoLink,
    required this.title,
    required this.profilePic,
    required this.time,
    required this.Subscriptions,
    required this.views,
    required this.ChannelName, 
  }) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late YoutubePlayerController _controller;
  bool isShowIcon = false;
  bool isPlaying = false;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.videoLink);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(autoPlay: true),
    );

    super.initState();
  }

  seekForward() {
    final currentPosition = _controller.value.position;
    final duration = _controller.value.metaData.duration;
    if (currentPosition.inSeconds + 10 > duration.inSeconds) {
      _controller.seekTo(currentPosition + Duration(seconds: 10));
    }
  }

  seekBackward() {
    final currentPosition = _controller.value.position;
    if (currentPosition.inSeconds - 10 > 0) {
      _controller.seekTo(currentPosition - Duration(seconds: 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              child: Stack(
                children: [
                  YoutubePlayer(controller: _controller),
                  Positioned(
                    top: 90,
                    left: 90,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: seekBackward,
                          icon: Icon(
                            Icons.replay_10_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 120),
                        IconButton(
                          onPressed: seekForward,
                          icon: Icon(
                            Icons.forward_10_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 8),
              child: Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      '${widget.views} views',
                      style: const TextStyle(
                        fontSize: 13.4,
                        color: Color(0xff5F5F5F),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      widget.time,
                      style: const TextStyle(
                        fontSize: 13.4,
                        color: Color(0xff5F5F5F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 14, right: 9),
              child: Row(
                children: [
                  CircleAvatar(radius: 20, backgroundColor: Colors.grey,backgroundImage: NetworkImage(widget.profilePic)),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.ChannelName,
                          style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
                        ),
                        Text(
                          '${widget.Subscriptions} Subscribers',
                          style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 35,
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: FilledButton(
                        style: FilledButton.styleFrom(backgroundColor: Colors.black),
                        onPressed: () {},
                        child: Text('Subscribe',style: TextStyle(fontSize: 14),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9, top: 14, right: 9),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: const BoxDecoration(
                        color: softBlueGreyBackGround,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.thumb_up, size: 19),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.thumb_down, size: 19),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 9, right: 9),
                      child: VideoExtraButton(
                        text: "Share",
                        iconData: Icons.share,
                      ),
                    ),
                    const VideoExtraButton(
                      text: "Remix",
                      iconData: Icons.analytics_outlined,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 9, right: 9),
                      child: VideoExtraButton(
                        text: "Download",
                        iconData: Icons.download,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           firstContentPage(),
          ],
        ),
      ),
    );
  }
}
