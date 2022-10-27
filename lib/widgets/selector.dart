


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

class DynamicSelector extends StatelessWidget {
  DynamicSelector({
    super.key,
    required this.header,
    required this.list,
    this.height,
  });
  final String header;
  final List<String> list;
  double? height;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);

    return SizedBox(
        height: height ?? 250.h,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
          child: Column(
            children: <Widget>[
              Container(
                width: 30.w,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: color.hoverColor,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children:  <Widget>[
                  Text(
                    header,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sourceSansPro(
                      color: color.primaryColor,
                      fontSize: 22.sp,
                      height: 34 / 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: list.length,
                    separatorBuilder: (BuildContext context,int index) {
                      return Divider(
                        color:color.primaryColor,
                      );
                    },
                    itemBuilder: (BuildContext context,int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context, list[index]);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: SizedBox(
                            height: 30.h,
                            child: Text(
                              list[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.sourceSansPro(
                                color: color.primaryColor,
                                fontSize: 14.sp,
                                height: 24 / 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },),
              ),
            ],
          ),
        ));
  }
}
