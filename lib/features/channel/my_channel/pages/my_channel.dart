import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/provider/userDataProvider.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/content.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/managingRow.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/tabContent.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/topHeader.dart';

class myChannel extends ConsumerWidget {
  const myChannel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(currentUserData)
        .when(
          data: (currentUser){return DefaultTabController(
            length: 7,
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  child: Column(
                    children: [
                      topHeader(user: currentUser,),
                      managingRow(),
                      contentColumn(),
                      tabContent(),
                    ],
                  ),
                ),
              ),
            ),
          );},
          error: (error, stackTrace) {return Text(error.toString());},
          loading: () => CircularProgressIndicator(),
        );
  }
}
