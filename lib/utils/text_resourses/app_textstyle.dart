import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// App TextStyles
TextStyle heading1(BuildContext context) => TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
    );
TextStyle heading1Contrast(BuildContext context) => TextStyle(
      color: Theme.of(context).backgroundColor,
      fontSize: 35.sp,
      fontWeight: FontWeight.w600,
    );
TextStyle heading2(BuildContext context) => TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 25.sp,
      fontWeight: FontWeight.w600,
    );
TextStyle smallHeading(BuildContext context) => TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    );
TextStyle smallHeadingContrast(BuildContext context) => TextStyle(
      color: Theme.of(context).backgroundColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    );

TextStyle bodyNormalBoldText(BuildContext context) => TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    );

TextStyle bodyNormalText(BuildContext context) => TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    );

TextStyle bodySmallText(BuildContext context) => TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
TextStyle bodySmallBoldText(BuildContext context) => TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    );
TextStyle bodyverySmallBoldText(BuildContext context) => TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );

TextStyle hintText(BuildContext context) => TextStyle(
      color: Colors.grey,
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
    );
