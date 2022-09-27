import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  const SvgImage({
    Key? key,
    required this.name,
    required this.height,
    required this.width,
  }) : super(key: key);

  final String? name;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      name!,
      height: height,
      width: width,
    );
  }
}
