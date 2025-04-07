import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateDataProvider = Provider(
  (ref) => updateData(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  ),
);

class updateData {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  updateData({required this.firestore, required this.auth});

  editDisplayName(displayname) async {
    await firestore.collection('users').doc(auth.currentUser!.uid).update({
      'displayName': displayname,
    });
  }
  editEmailName(email) async {
    await firestore.collection('users').doc(auth.currentUser!.uid).update({
      'email': email,
    });
  }
  editDescription(description) async {
    await firestore.collection('users').doc(auth.currentUser!.uid).update({
      'description': description,
    });
  }

}
