import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage with ChangeNotifier {
  GetStorage box = GetStorage();
  static const _keyUser = 'username';
  static const _keyEmail = 'email';
  static const _keyPassword = 'pwd';
  static const _keyPhoneNum = 'pwd';

  static const String PREFS_KEY_IS_USER_LOGGED_IN =
      "PREFS_KEY_IS_USER_LOGGED_IN";

  static const _keyCredential = 'cred';
  static const _keyAdNum = 'adNum';

   setData(String key, dynamic value) => box.write(key, value);

  Future setProfileData(String username, String email, String password) async {
    await box.write(_keyUser, username);
    await box.write(_keyEmail, email);
    await box.write(_keyPassword, password);
  }

  Future setAdsNum(String num) async {
    await box.write(_keyAdNum, num);
  }

  Future<void> setIsUserLoggedIn(bool isUserLoggedIn) async {
    await setData(PREFS_KEY_IS_USER_LOGGED_IN, isUserLoggedIn);
    notifyListeners();
  }

  //GETTERS
   String? getCallNum() {
    return box.read(_keyPhoneNum);
  }

   String? getUsername() {
    return box.read(_keyUser);
  }



   String? getEmail() {
    return box.read(_keyEmail);
  }

   String? getPassword() {
    return box.read(_keyPassword);
  }


   Future<bool> isUserLoggedIn() async {
    return box.read(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  //Save User Credential To Local Storage
   Future setUserCredential({UserCredential? credential}) async {
    await box.write(_keyCredential, credential!.user!.uid);
  }

   String? getUserCredentialUid() {
    return box.read(_keyCredential);
  }
}
