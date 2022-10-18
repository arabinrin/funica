import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Storaged with ChangeNotifier {
  List<String?> get getImagePath {
    return imagePat;
  }

  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  List<String?> imagePat = [];

  Future<List<String>> uploadFile(List<XFile> filePath) async {
    List<String> _path = [];
    for (XFile _image in filePath) {
      var imageUrl = await uploadImage(_image);

      _path.add(imageUrl);
    }

    print('this is $_path');

    imagePat = _path;
    notifyListeners();

    return _path;
  }

  // Future<firebase_storage.ListResult> listFiles() async{
  //   firebase_storage.ListResult results = await storage.ref('${FirebaseAuth.instance.currentUser!.uid}/productImages').listAll();

  //   results.items.forEach((firebase_storage.Reference ref){
  //     print('Found files: $ref');
  //   });
  //   return results;
  // }

  Future<String> uploadImage(XFile image) async {
    Reference db = storage
        .ref()
        .child('product/')
        .child(image.name);
    // storage.ref('${FirebaseAuth.instance.currentUser!.uid}/productImages/');

    await db.putFile(File(image.path));

    return await db.getDownloadURL();
  }
}
