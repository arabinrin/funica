import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LogoButton extends StatelessWidget {
  const LogoButton({
    Key? key,
    required this.image,
    this.tap,
  }) : super(key: key);

  final String image;
  final void Function()? tap;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);

    return InkWell(
      onTap: tap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
        height: 50.h,
        width: 60.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: color.hoverColor),
          color: color.indicatorColor
,
        ),
        child: Center(
          child: SizedBox(
            height: 20.r,
            width: 20.r,
            child: Image.asset(image),
          ),
        ),
      ),
    );
  }
}
