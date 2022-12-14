import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:funica/models/category_model.dart';

import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryGrid extends StatelessWidget {
  CategoryGrid({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final ThemeData color = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      height: height * .28,
      width: width,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: .8,
        ),
        itemCount: categoryModel.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  padding: EdgeInsets.all(15.r),
                  height: 60.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                    // color: color.hoverColor,
                    shape: BoxShape.circle,
                    color: color.hoverColor,
                  ),
                  child: Image.asset(categoryModel[index].imgIcon!,
                      color: color.primaryColor),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  categoryModel[index].category!,
                  style: GoogleFonts.poppins(
                      textStyle: bodyverySmallBoldText(context)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
