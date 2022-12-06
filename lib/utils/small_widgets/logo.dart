import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.back,
    required this.line,
  });

 final Color? back;
 final  Color? line;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(shape: BoxShape.circle, color: back),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            Logoline(
              length: 50,
              color: line,
            ),
            Logoline(length: 40, color: line),
            SizedBox(
              width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget> [
                  Logoline(
                    length: 25,
                    color: line,
                  ),
                  Container(
                    height: 5,
                    width: 5,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: line),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Logoline extends StatelessWidget {
  const Logoline({super.key, required this.color, required this.length});
  final double length;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: length,
      height: 10,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50), topRight: Radius.circular(50),),
      ),
    );
  }
}
