import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';


class DividerWithText extends StatelessWidget {
  const DividerWithText({
    super.key,
    required this.width,
    required this.text,
  });

  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData color = Theme.of(context);

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
      SizedBox(
        width: width,
        child: Divider(
          thickness: 0.8.h,
          color: color.hintColor,
        ),
      ),
      Text(
        text,
        style: GoogleFonts.poppins(
          textStyle: bodySmallText(context),
        ),
      ),
      SizedBox(
        width: width,
        child: Divider(
          thickness: 0.8.h,
          color: color.hintColor,
        ),
      ),
    ],);
  }
}
