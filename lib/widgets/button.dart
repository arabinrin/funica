import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String? title;
  Color? color;
    Color? textcolor;

  Button({
    required this.title,
    required this.color,
        required this.textcolor,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.15),
        spreadRadius: 4,
        blurRadius: 4,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
        color: color,
      ),
      child: Center(
        child: Text(
          title.toString(),
          style: TextStyle(
            color: textcolor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
