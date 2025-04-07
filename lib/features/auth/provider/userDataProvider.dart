import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/model/usermodel.dart';
import 'package:youtube_clone/features/auth/repo/userDataService.dart';

final currentUserData = FutureProvider<userModel>((ref)async{
  final userModel user = await ref.watch(userDataServiceProvider).fetchDataFromFirebase();
  return user;
});