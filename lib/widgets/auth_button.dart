import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButton extends StatelessWidget {
  String title;
  String image;

  AuthButton({
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);

    return Container(
      height: 60.h,
      margin: EdgeInsets.symmetric(vertical:7.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(color: color.highlightColor),
        color: color.cardColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.h,
              width: 25.w,
              child: Image.asset(image),
             
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                textStyle: bodySmallBoldText(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
