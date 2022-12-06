import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData color = Theme.of(context);

    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0.h),
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_sharp,
                  color: color.primaryColor,
                  size: 25.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
