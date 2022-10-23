import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseMethods {
  Future<void> addUserInfo(Map<String, dynamic> userData) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(userData)
        .catchError((e) {});
  }

  getUserdataById(String? _uid) async {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    final userDate = userDoc.data() as dynamic;

    return userDate;
  }

  getUserInfo(String email) async {
    return FirebaseFirestore.instance
        .collection('users')
        .where('userEmail', isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserInfoByName(String? name) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("userName", isEqualTo: name)
        .get()
        .catchError((e) {
      print(e.toString());
    });
    // final userDate = userDoc as dynamic;
  }

  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection("users")
        // .where('userId', isNotEqualTo: 'FirebaseAuth.instance.currentUser!.uid')
        .where('userName', isEqualTo: searchField)
        .get();
  }

  users() {
    return FirebaseFirestore.instance.collection("users").get();
  }

  dynamicUsers() {
    FirebaseFirestore.instance
        .collection('users')
        .where('userId', isNotEqualTo: 'FirebaseAuth.instance.currentUser!.uid')
        .get()
        .then((value) {});
  }

  Future<bool>? addProduct(Map<String, dynamic> chatRoom, String productID) {
    FirebaseFirestore.instance
        .collection("prodcuts")
        .doc(productID)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
    return null;
  }


}
