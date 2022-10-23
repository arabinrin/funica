import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';

class Notification extends StatelessWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios),
                      SizedBox(
                        width: 20.w,
                      ),
                    ],
                  ),
                  Icon(Icons.more_rounded),
                ],
              ),
              SizedBox(height: 30.h,),
              Text('Today',style:bodySmallText(context).copyWith(fontWeight: FontWeight.w800)), 
              
            ],
          ),
        ),
      ),
    );
  }
}
