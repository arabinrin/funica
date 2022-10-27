import 'package:flutter/material.dart';

void changeScreen(BuildContext context, Widget widget) {
  Navigator.push(
     context,
     PageRouteBuilder<dynamic>(
      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => FadeTransition(
        opacity: animation,
        child: widget,
      ),
    ),
  );
}

void changeScreenReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder<dynamic>(
      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => FadeTransition(
        opacity: animation,
        child: widget,
      ),
    ),
  );
}

void changeScreenPushUntil(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder<dynamic>(
      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => FadeTransition(
        opacity: animation,
        child: widget,
      ),
    ),
    (Route<dynamic> route) => false,
  );
}
