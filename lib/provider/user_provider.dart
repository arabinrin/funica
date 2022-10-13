import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:funica/repository/database.dart';
import 'package:provider/provider.dart';

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
        email = snapshot['email'];
        name = snapshot['fullName'];
        pic = snapshot['profilePhoto'];
      } else {}
    });
    notifyListeners();
  }
}
