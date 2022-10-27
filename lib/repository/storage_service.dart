import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Storaged with ChangeNotifier {
  List<String> get getImagePath {
    return imagePat;
  }

  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  List<String> imagePat = <String>[];

  Future<List<String>> uploadFile(List<XFile> filePath) async {
    final List<String> path = [];
    for (final XFile image in filePath) {
      final String imageUrl = await uploadImage(image);

      path.add(imageUrl);
    }

    // print('this is $path');

    imagePat = path;
    notifyListeners();

    return path;
  }

  // Future<firebase_storage.ListResult> listFiles() async{
  //   firebase_storage.ListResult results = await storage.ref('${FirebaseAuth.instance.currentUser!.uid}/productImages').listAll();

  //   results.items.forEach((firebase_storage.Reference ref){
  //     print('Found files: $ref');
  //   });
  //   return results;
  // }

  Future<String> uploadImage(XFile image) async {
    final Reference db = storage
        .ref()
        .child('product/')
        .child(image.name);
    // storage.ref('${FirebaseAuth.instance.currentUser!.uid}/productImages/');

    await db.putFile(File(image.path));

    return await db.getDownloadURL();
  }
}
