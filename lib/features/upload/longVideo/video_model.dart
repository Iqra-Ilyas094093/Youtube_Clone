import 'dart:convert';

class VideoModel {
  final String videoUrl;
  final String thumbnail;
  final String title;
  final DateTime datePublished;
  final int views;
  final String videoId;
  final String userId;
  final List likes;
  final String type;

  VideoModel({
    required this.videoUrl,
    required this.thumbnail,
    required this.title,
    required this.datePublished,
    required this.views,
    required this.videoId,
    required this.userId,
    required this.likes,
    required this.type,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(videoUrl: json["videoUrl"],
      thumbnail: json["thumbnail"],
      title: json["title"],
      datePublished: json["datePublished"] as DateTime,
      views: json["views"] as int,
      videoId: json["videoId"],
      userId: json["userId"],
      likes: List.of(json["likes"]).map((
          i) => i /* can't generate it properly yet */).toList(),
      type: json["type"],);
  }

  Map<String, dynamic> toJson() {
    return {
      "videoUrl": this.videoUrl,
      "thumbnail": this.thumbnail,
      "title": this.title,
      "datePublished": this.datePublished,
      "views": this.views,
      "videoId": this.videoId,
      "userId": this.userId,
      "likes": jsonEncode(this.likes),
      "type": this.type,
    };
  }

}
