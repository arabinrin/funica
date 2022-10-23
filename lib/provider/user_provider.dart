import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:funica/repository/database.dart';

class UserInfomation with ChangeNotifier {
  DatabaseMethods databaseMethods = DatabaseMethods();
  String email = '';
  String name = 'NAME';
  String? pic;
  userInfo() async {
    await databaseMethods
        .getUserdataById(FirebaseAuth.instance.currentUser!.uid)
        .then((snapshot) {
      if (snapshot != null) {
        email = snapshot['email'].toString();
        name = snapshot['fullName'].toString();
        pic = snapshot['profilePhoto'].toString();
      } else {}
    });
    notifyListeners();
  }
}


 
