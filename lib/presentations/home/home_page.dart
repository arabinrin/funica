import 'package:flutter/material.dart';
import 'package:funica/presentations/registration/profile_form.dart';
import 'package:funica/utils/navigator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap:()=> changeScreen(context, ProfileForm()),
          child: Center(
        child: Text('Homepage'),
      )),
    );
  }
}
