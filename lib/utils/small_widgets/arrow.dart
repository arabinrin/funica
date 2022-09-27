import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);

    return Row(
      children: [
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
