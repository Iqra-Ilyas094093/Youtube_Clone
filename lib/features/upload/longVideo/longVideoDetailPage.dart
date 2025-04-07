import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/methods.dart';
import 'package:youtube_clone/features/upload/longVideo/video_repo.dart';
import 'package:youtube_clone/utilities/colors.dart';
import 'package:uuid/uuid.dart';

class DetailPage extends ConsumerStatefulWidget {
  final File? video;
  const DetailPage(this.video,  {super.key});

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  File? image;
  bool isThumbnailSelected = false;
  String randomNumber = const Uuid().v4();
  String VideorandomNumber = const Uuid().v4();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: 300,
                //uploadImager.jpg
                child:Image.asset('assets/images/uploadImager.jpg'),
              ),
              SizedBox(height: 10),
              //textformfield
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter the title',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  )
                ),

              ),
              SizedBox(height: 20),
              //textformfield
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Enter the video description here',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                ),
                maxLines: 5,
              ),
              SizedBox(height: 14),
              GestureDetector(
                onTap: () async {
                  image = await pickImage();
                  isThumbnailSelected = true;
                  setState(() {});
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  color: kAssistingColor,
                  child: Center(
                    child: Text(
                      'Select Thumbnail ',
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 14),
              isThumbnailSelected
                  ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Image.file(image!, cacheHeight: 130, cacheWidth: 350),
              )
                  : SizedBox(),
              isThumbnailSelected
                  ? GestureDetector(
                onTap: () async {
                  String thumbnail = await putfileInStorage(
                      image, randomNumber, 'image');
                  String videoUrl = await putfileInStorage(widget.video, randomNumber, 'video');
                  ref.watch(longVideoProvider).uploadVideoToFirestore(
                      videoUrl: videoUrl,
                      thumbnail: thumbnail,
                      title: titleController.text,
                      datePublished: DateTime.now(),
                      userId: FirebaseAuth.instance.currentUser!.uid,
                      videoId: VideorandomNumber);
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  color: kAssistingColor,
                  child: Center(
                    child: Text(
                      'Upload',
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
