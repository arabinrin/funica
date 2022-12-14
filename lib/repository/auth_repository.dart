import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funica/models/user_model.dart';
import 'package:funica/presentations/registration/profile_form.dart';
import 'package:funica/presentations/registration/set_fingerprint.dart';
import 'package:funica/repository/user_prefs.dart';
import 'package:funica/utils/navigator.dart';
import 'package:funica/utils/small_widgets/dialog.dart';
import 'package:funica/utils/small_widgets/snackbar.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

class AuthRepository {
  UserModel? userModel;
  //Sign Up
  Future<void> createWithEmailAndPwd(
    String username,
    String userSignUpEmail,
    String userSignUpPassword,
    BuildContext context,
    // String lName,
    // String phoneNumber,
  ) async {
    final bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final Storage storage = Storage();

    try {
      if (isConnected == true) {
        final UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: userSignUpEmail, password: userSignUpPassword);
        await userCredential.user!.updateDisplayName(username);
        await userCredential.user!.sendEmailVerification().then((value) async {
          await storage.setIsUserLoggedIn(true);
          await storage.setProfileData(userSignUpEmail, username);

          changeScreenPushUntil(context, const ProfileForm());
          cToast(msg: 'Yay! Signed up Successfully 🤩', context: context);
          await FirebaseAnalytics.instance
              .logEvent(name: 'User just signed up', parameters: {
            'uid': FirebaseAuth.instance.currentUser!.uid,
          });
        });
      } else {
        showSuccessDialog(
            context: context,
            header: 'No network connection 😞',
            body: 'Retry',
            path: 'oops.json');
        //  cToast(
        //   msg: "Oops! No network connection 😞",
        //   color: kErrorColor,
        //   context: context);
      }
    } catch (e) {
      cToast(msg: 'Oops! An error occured.. 😞 \n $e', context: context);
    }
  }

  //Sign In
  Future<void> signInWithEmail(
      String email, String password, BuildContext context) async {
    final bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final Storage storage = Storage();
    

    try {
      if (isConnected == true) {
       await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((UserCredential value) async {
          await storage.setIsUserLoggedIn(true);
          final QuerySnapshot userSnapShots =
              await FirebaseFirestore.instance.collection('user').get();
          userSnapShots.docs.map((QueryDocumentSnapshot<Object?> element) {
            if (FirebaseAuth.instance.currentUser!.uid ==
                element.get('userId')) {
              userModel = UserModel(
                username: element.get('userName').toString() ,
                email: element.get('email').toString(),
              );

              storage.setProfileData(
                userModel!.email,
                userModel!.username,
              );
            }
          }).toList();
          changeScreenPushUntil(context, const Finngerprint());

          cToast(msg: 'Yay! Signed In 🤩', context: context);

          return value;
        });
      } else {
        showSuccessDialog(
            context: context,
            header: 'No network connection 😞',
            body: 'Retry',
            path: 'oops.json');
      }
    } catch (e) {
      print(e.toString());
      cToast(
          msg:
              'We cannot find an account with this email and password. Please check your details 😞',
          context: context);
    }
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      cToast(msg: 'Password Reset Email sent', context: context);
    } on FirebaseAuthException catch (e) {
      cToast(msg: e.message!, context: context);
    }
  }

  void showSnackBar(BuildContext context, String? text) {
    final ThemeData color = Theme.of(context);

    final SnackBar snackBar = SnackBar(
      content: Text(
        text!,
        style: bodySmallText(context).copyWith(color: color.primaryColor),
      ),
      backgroundColor: color.backgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
