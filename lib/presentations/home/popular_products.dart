
import 'package:flutter/material.dart';
import 'package:funica/models/category_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';


class PopularProducts extends StatefulWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    final color = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
        height: 55.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryModel.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  setState(() {
                    selected = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                  height: 25.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 1,
                        color: color.primaryColor,
                      ),
                      color: index == selected
                          ? color.primaryColor
                          : Colors.transparent),
                  child: Center(
                    child: Text(
                      categoryModel[index].category!,
                      style: GoogleFonts.poppins(
                          textStyle: bodyverySmallBoldText(context).copyWith(
                              color: index == selected
                                  ? color.backgroundColor
                                  : color.primaryColor)),
                    ),
                  ),
                ));
          },
        ),
        );
  }
}
