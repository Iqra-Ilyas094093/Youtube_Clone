import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/upload/longVideo/video_model.dart';



final longVideoProvider = Provider((ref)=>videoRepository(firestore: FirebaseFirestore.instance));


class videoRepository {
  FirebaseFirestore firestore;
  videoRepository({required this.firestore});

  uploadVideoToFirestore({
    required String videoUrl,
    required String thumbnail,
    required String title,
    required DateTime datePublished,
    required String userId,
    required String videoId,
  }) async {
    VideoModel video = VideoModel(videoUrl: videoUrl,
        thumbnail: thumbnail,
        title: title,
        datePublished: datePublished,
        views: 0,
        videoId: videoId,
        userId: userId,
        likes: [],
        type: 'video');
    await firestore.collection('videos').doc(videoId).set(video.toJson());
  }


}
