import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:youtube_clone/features/upload/longVideo/longVideoDetailPage.dart';


Future pickVideo(context)async{
  XFile? file = await ImagePicker().pickVideo(source: ImageSource.gallery);
  File video = File(file!.path);
  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(video)));
  return video;
}
Future<File?> pickImage()async{
  XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  File image = File(file!.path);
  return image;
}

Future<String> putfileInStorage(file,number,fileType)async{
  final ref = FirebaseStorage.instance.ref().child('$fileType/$number');
  final upload = ref.putFile(file);
  final snapshot = await upload;
  final downloadUrl = await snapshot.ref.getDownloadURL();
  return downloadUrl;
}