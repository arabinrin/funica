import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funica/models/user_model.dart';
import 'package:funica/presentations/registration/profile_form.dart';
import 'package:funica/repository/user_prefs.dart';
import 'package:funica/utils/navigator.dart';
import 'package:funica/utils/small_widgets/dialog.dart';
import 'package:funica/utils/small_widgets/snackbar.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:provider/provider.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

class AuthRepository {
  UserModel? userModel;
  //Sign Up
  Future<void> createWithEmailAndPwd(
    String userSignUpEmail,
    String userSignUpPassword,
    BuildContext context,
    String fName,
    String lName,
    String phoneNumber,
  ) async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final Storage storage = Provider.of<Storage>(context, listen: false);
    final color = Theme.of(context);

    try {
      if (isConnected == true) {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: userSignUpEmail, password: userSignUpPassword);
        await userCredential.user!.sendEmailVerification();
        await FirebaseFirestore.instance
            .collection("UserData")
            .doc(userCredential.user!.uid)
            .set({
          "userId": userCredential.user!.uid,
          "fName": fName,
          "lName": lName,
          "email": userSignUpEmail,
          "password": userSignUpPassword,
          "registrationTime": DateTime.now(),
          "phoneNumber": phoneNumber
        }).then((value) async {
          await storage.setIsUserLoggedIn(true);
          await storage.setProfileData(fName, lName, userSignUpEmail,
              userSignUpPassword, phoneNumber);

          changeScreenPushUntil(context, ProfileForm());
          cToast(msg: "Yay! Signed up Successfully 🤩", context: context);
          FirebaseAnalytics.instance
              .logEvent(name: 'User just signed up', parameters: {
            'uid': FirebaseAuth.instance.currentUser!.uid,
          });
        });
      } else {
        showSuccessDialog(
            context: context,
            header: "No network connection 😞",
            body: "Retry",
            path: 'oops.json');
        //  cToast(
        //   msg: "Oops! No network connection 😞",
        //   color: kErrorColor,
        //   context: context);
      }
    } catch (e) {
      print(e.toString());
      cToast(msg: "Oops! An error occured.. 😞", context: context);
    }
  }

  //Sign In
  Future<void> signInWithEmail(
      String email, String password, BuildContext context) async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final Storage storage = Provider.of<Storage>(context, listen: false);
    final color = Theme.of(context);
    try {
      if (isConnected == true) {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          await storage.setIsUserLoggedIn(true);
          QuerySnapshot userSnapShots =
              await FirebaseFirestore.instance.collection("UserData").get();
          userSnapShots.docs.map((element) {
            if (FirebaseAuth.instance.currentUser!.uid ==
                element.get("userId")) {
              userModel = UserModel(
                fName: element.get("fName") ?? "",
                email: element.get("email") ?? "",
                lName: element.get("lName") ?? "",
                password: element.get("password") ?? "",
                age: element.get("age") ?? "",
                phoneNum: element.get("phoneNumber") ?? "",
                location: element.get("location") ?? "",
              );

              storage.setProfileData(
                  userModel!.fName,
                  userModel!.lName,
                  userModel!.email,
                  userModel!.password,
                  userModel!.location,
                );
            }
          }).toList();
          changeScreenPushUntil(context, ProfileForm());

          cToast(msg: "Yay! Signed In 🤩", context: context);
          // cToast(
          //     msg: "Yay! Email verifification successful 🤩",
          //     color: kPrimaryColor,
          //     context: context);
          // if (value.user!.emailVerified) {

          // } else {
          //   cToast(
          //       msg: "Email not verified yet",
          //       color: kErrorColor,
          //       context: context);
          //   Navigator.pushAndRemoveUntil(
          //       context,
          //       MaterialPageRoute(builder: (ctx) => const ConfirmEmail()),
          //       (route) => false);
          // }
          return value;
        });
      } else {
        showSuccessDialog(
            context: context,
            header: "No network connection 😞",
            body: "Retry",
            path: 'oops.json');
        // cToast(
        //     msg: "Oops! No network connection",
        //     color: kErrorColor,
        //     context: context);
      }
    } catch (e) {
      print(e.toString());
      cToast(
          msg:
              "We cannot find an account with this email and password. Please check your details 😞",
          context: context);
    }
  }

  Future resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      showSnackBar(context, "Password Reset Email sent");
    } on FirebaseAuthException catch (e) {
      print(e.message);
      showSnackBar(context, e.message);
    }
  }

  void showSnackBar(BuildContext context, String? text) {
    final color = Theme.of(context);

    final snackBar = SnackBar(
      content: Text(
        text!,
        style: bodySmallText(context).copyWith(color: color.primaryColor),
      ),
      backgroundColor: color.backgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // //Sign out
  // static Future<void> signOut(BuildContext context) {
  //       final color = Theme.of(context);

  //   return FirebaseAuth.instance.signOut().then((value) {
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (ctx) => const PasswordSignIn()),
  //         (route) => false);
  //     cToast(msg: "Signed out", color: kPrimaryColor, context: context);
  //   });
  // }

  /// Admin Pass
}
