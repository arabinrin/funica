import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

class Storage {
  GetStorage box = GetStorage();
  static const String _keyUser = 'username';
  static const String _keyEmail = 'email';
  static const String _keyPassword = 'pwd';
  static const String _keyPhoneNum = 'pwd';

  // ignore: constant_identifier_names
  static const String PREFS_KEY_IS_USER_LOGGED_IN =
      'PREFS_KEY_IS_USER_LOGGED_IN';
  // ignore: constant_identifier_names
  static const String PREFS_KEY_IS_USER_BIOACTIVE =
      'PREFS_KEY_IS_USER_BIOACTIVE';

  static const String _keyCredential = 'cred';
  static const String _keyAdNum = 'adNum';

  bool setData(String key, dynamic value) {
    box.write(key, value);
    return true;
  }

  Future<dynamic> setProfileData(String username, String email) async {
    await box.write(_keyUser, username);
    await box.write(_keyEmail, email);
  }

  Future<dynamic> setAdsNum(String num) async {
    await box.write(_keyAdNum, num);
  }

  Future<void> setIsUserLoggedIn(bool isUserLoggedIn) async {
     setData(PREFS_KEY_IS_USER_LOGGED_IN, isUserLoggedIn);
  }

  Future<void> setFinger(bool isbioActive) async {
    setData(PREFS_KEY_IS_USER_BIOACTIVE, isUserLoggedIn);
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

  bool isUserBioActive() {
    return box.read(PREFS_KEY_IS_USER_BIOACTIVE) ?? false;
  }

  //Save User Credential To Local Storage
  Future setUserCredential({UserCredential? credential}) async {
    await box.write(_keyCredential, credential!.user!.uid);
  }

  String? getUserCredentialUid() {
    return box.read(_keyCredential);
  }
}
