import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/content/longVideo/parts/video.dart';
import 'package:youtube_clone/model.dart';
import 'package:youtube_clone/practice.dart';

import '../account/accountPage.dart';
import '../auth/provider/userDataProvider.dart';

class firstContentPage extends StatefulWidget {
  const firstContentPage({super.key});

  @override
  State<firstContentPage> createState() => _firstContentPageState();
}

class _firstContentPageState extends State<firstContentPage> {
  List<VideoDataModel> videoModel = [];

  @override
  void initState() {
    videoModel = getVideoData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: 160,
              child: Image.asset('assets/images/logo.png',),
              // child: Image.asset('assets/images/youtube.jpg'),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50,
                  width: 45,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/cast.png', scale: 1),
                    // 'assets/icons/cast.png',
                  ),
                ),
                Container(
                  height: 40,
                  width: 45,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/notification.png'),
                    // 'assets/icons/notification.png',
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/search.png'),
                    // 'assets/icons/search.png',
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return ref
                        .watch(currentUserData)
                        .when(
                          data: (currentUser) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              accountPage(user: currentUser),
                                    ),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.grey,
                                  backgroundImage: CachedNetworkImageProvider(
                                    currentUser.profilePic.toString(),
                                  ),
                                ),
                              ),
                            );
                          },
                          error: (error, stackTrace) {
                            print(stackTrace.toString());
                            print(error.toString());
                            return Text(error.toString());
                          },
                          loading: () => CircularProgressIndicator(),
                        );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: videoModel.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15.0, top: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) => Video(
                          videoLink: videoModel[index].videoLink.toString(),
                          title: videoModel[index].title.toString(),
                          profilePic: videoModel[index].profilePic.toString(),
                          time: videoModel[index].time.toString(),
                          Subscriptions: videoModel[index].Subscriptions.toString(),
                          views: videoModel[index].views.toString(),
                          ChannelName: videoModel[index].ChannelName.toString(),
                        ),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    color: Colors.grey,
                    child: CachedNetworkImage(
                      imageUrl: videoModel[index].thumbnail.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 5,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                            videoModel[index].profilePic.toString(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 280,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    videoModel[index].title.toString(),
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '${videoModel[index].ChannelName.toString()}  ${videoModel[index].views} views ${videoModel[index].time} ',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.more_vert, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
