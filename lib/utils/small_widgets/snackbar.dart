import 'package:flutter/material.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

cToast({required String msg, required BuildContext context}) {
  final color = Theme.of(context);

  showTopSnackBar(
    context,
    animationDuration: const Duration(milliseconds: 1200),
    reverseAnimationDuration: const Duration(milliseconds: 550),
    displayDuration: const Duration(milliseconds: 3000),
    CustomSnackBar.success(
      iconPositionLeft: 8,
      textStyle: bodySmallText(context).copyWith(color: color.backgroundColor),
      message: msg,
      backgroundColor: color.primaryColor..withOpacity(.4),
      icon: Icon(Icons.info_rounded, color: color.primaryColor),
    ),
  );
}
