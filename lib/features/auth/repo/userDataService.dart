import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:youtube_clone/features/auth/model/usermodel.dart';

final userDataServiceProvider = Provider((ref) {
  return userDataService(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
});

class userDataService {
  FirebaseAuth auth;
  FirebaseFirestore firestore;

  userDataService({required this.auth, required this.firestore});

  addUserDatatoFirebase({
    required String displayName,
    required String username,
    required String email,
    required String profilePic,
    required String description,
  }) async {
    userModel user = userModel(
      displayName: displayName,
      username: username,
      email: email,
      profilePic: profilePic,
      subscriptions: [],
      videos: 0,
      userId: auth.currentUser!.uid,
      description: description,
      type: 'user',
    );
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .set(user.toJson());
  }

  Future<userModel> fetchDataFromFirebase()async{
  final UserMap = await firestore.collection('users').doc(auth.currentUser!.uid).get();
  userModel user = userModel.fromJson(UserMap.data()!);
  return user;
  }
}
