
class userModel {
  final String displayName;
  final String username;
  final String email;
  final String profilePic;
  final List<String> subscriptions;
  final int videos;
  final String userId;
  final String description;
  final String type;

  userModel({
    required this.displayName,
    required this.username,
    required this.email,
    required this.profilePic,
    required this.subscriptions,
    required this.videos,
    required this.userId,
    required this.description,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      "displayName": displayName,
      "username": username,
      "email": email,
      "profilePic": profilePic,
      "subscriptions": subscriptions,
      "videos": videos,
      "userId": userId,
      "description": description,
      "type": type,
    };
  }

  factory userModel.fromJson(Map<String, dynamic> json) {
    return userModel(displayName: json["displayName"],
      username: json["username"],
      email: json["email"],
      profilePic: json["profilePic"] as String,
      subscriptions: List<String>.from(json['subscriptions'] ?? []),
      videos: json['videos'] as int ,
      userId: json["userId"],
      description: json["description"],
      type: json["type"],);
  }
}
