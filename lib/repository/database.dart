import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseMethods {
  Future<void> addUserInfo(Map<String, dynamic> userData) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(userData);
  }

  Future<dynamic> getUserdataById(String? _uid) async {
    final DocumentSnapshot<dynamic> userDoc =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    final userDate = userDoc.data() as dynamic;

    return userDate;
  }

  Future<Future<QuerySnapshot<Map<String, dynamic>>>> getUserInfo(
      String email) async {
    return FirebaseFirestore.instance
        .collection('users')
        .where('userEmail', isEqualTo: email)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserInfoByName(
      String? name) async {
    return FirebaseFirestore.instance
        .collection('users')
        .where('userName', isEqualTo: name)
        .get();

    // final userDate = userDoc as dynamic;
  }

  dynamicUsers() {
    FirebaseFirestore.instance
        .collection('users')
        .where('userId', isNotEqualTo: 'FirebaseAuth.instance.currentUser!.uid')
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> value) {});
  }

  Future<bool>? addProduct(Map<String, dynamic> chatRoom, String productID) {
    FirebaseFirestore.instance
        .collection('prodcuts')
        .doc(productID)
        .set(chatRoom);
    return null;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> users() {
    return FirebaseFirestore.instance.collection('users').get();
  }
}
