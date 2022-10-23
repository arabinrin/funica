import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:funica/models/user_model.dart';

import 'package:funica/utils/small_widgets/snackbar.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRespository {
  void pickImage(BuildContext context) async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      await croppingImage(pickedImage);

      cToast(msg: 'Profile Picture uploaded', context: context);
    } else {
      cToast(msg: 'Oops! failed', context: context);
    }
  }

  croppingImage(pickedImage) async {
    File? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedImage.path.toString(),
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: const AndroidUiSettings(
          toolbarTitle: 'Crop to your taste',
          toolbarColor: Colors.black,
          statusBarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          activeControlsWidgetColor: Colors.black87,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: const IOSUiSettings(
        minimumAspectRatio: 1.0,
      ),
    );
    // return File(croppedFile!.path);
    await uploadToStorage(File(croppedFile!.path));
  }

// upload to firebase storage
  Future<void> uploadToStorage(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('image')
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    String userId = FirebaseAuth.instance.currentUser!.uid.toString();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "userId": userId.toString(),
    }, SetOptions(merge: true));
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "profilePhoto": downloadUrl.toString(),
    }, SetOptions(merge: true));
  }

  Future<void> editUserInfo(UserDetail userDetail) async {
    await FirebaseFirestore.instance.collection('products').doc().set({
      "userId": FirebaseAuth.instance.currentUser!.uid,
      "userName": userDetail.nickname,
      "fullName": userDetail.fName,
      "birthday": userDetail.birthday,
      "email": userDetail.email,
      "phone": userDetail.phoneNum,
      "gender": userDetail.gender,
      "profilePhoto": userDetail.imgUrl,
    }, SetOptions(merge: true));
  }
}
