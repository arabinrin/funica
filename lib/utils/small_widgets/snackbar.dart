import 'package:flutter/material.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

 void cToast({required String msg, required BuildContext context}) {
  final ThemeData  color = Theme.of(context);

  showTopSnackBar(
    context,
    CustomSnackBar.success(
      iconPositionLeft: 8,
      textStyle: bodySmallText(context).copyWith(color: color.backgroundColor),
      message: msg,
      backgroundColor: color.primaryColor.withOpacity(.7),
      icon: Icon(Icons.info_rounded, color: color.primaryColor),
    ),
  );
}
