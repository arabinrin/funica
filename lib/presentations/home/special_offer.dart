import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:funica/models/product_model.dart';

import 'dart:ui' as ui;

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialOffer extends StatefulWidget {
  const SpecialOffer({Key? key}) : super(key: key);

  @override
  State<SpecialOffer> createState() => _SpecialOfferState();
}

class _SpecialOfferState extends State<SpecialOffer> {
  // final _sliderKey = GlobalKey();

  ui.Image? image;
  bool isLoaded = false;
  ByteData? pngBytes;

  double discout(total, discount) {
    double amount = discount * 100;
    return amount / total;
  }

  // getUiImage(String img) async {
  //   ByteData data = await rootBundle.load(img);
  //   image = await decodeImageFromList(data.buffer.asUint8List());
  //   await getPNG();
  //   setState(() {
  //     isLoaded = true;
  //   });
  // }

  // getPNG() async {
  //   pngBytes = await image?.toByteData(format: ui.ImageByteFormat.png);
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final color = Theme.of(context);
    return Container(
      height: height * .25,
      width: width,
      decoration: BoxDecoration(
        color: color.hoverColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: CarouselSlider.builder(
          unlimitedMode: true,
          slideBuilder: (index) {
            // getUiImage(products[index].image!);
            // pngBytes = cutImage(context: context, image: image!);
            // setState(() {});

            return SizedBox(
              child: Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    width: width * .45,
                    height: height * .25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          '${discout(products[index].price, products[index].discount).toStringAsFixed(2)}%',
                          style: GoogleFonts.poppins(
                              textStyle: heading2(context)
                                  .copyWith(fontWeight: FontWeight.w700)),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Today's special!",
                          style: GoogleFonts.poppins(
                            textStyle: bodySmallBoldText(context).copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Get discount for every order. Only for today",
                          style: GoogleFonts.poppins(
                            textStyle: bodySmallBoldText(context)
                                .copyWith(fontSize: 11.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: 30.w,
                  // ),
                  Image.asset(
                    products[index].image![0]!,
                    height: height * .2,
                    width: width * .4,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            );
          },
          // slideTransform: CubeTransform(),
          slideIndicator: CircularSlideIndicator(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            itemSpacing: 10,
            indicatorRadius: 4,
            indicatorBorderWidth: 1,
            currentIndicatorColor: color.primaryColor.withOpacity(.7),
            indicatorBackgroundColor: color.primaryColor.withOpacity(
              .5,
            ),
          ),
          itemCount: products.length),
    );
  }
}
