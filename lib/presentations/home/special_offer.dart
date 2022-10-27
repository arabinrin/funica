import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:funica/models/product_model.dart';

import 'dart:ui' as ui;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/provider/product_provider.dart';
import 'package:funica/repository/removbg.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SpecialOffer extends StatelessWidget {
  SpecialOffer({Key? key}) : super(key: key);

  // final _sliderKey = GlobalKey();

  ui.Image? image;
  bool isLoaded = false;
  ByteData? pngBytes;

  double discout(double total, double discount) {
    final double amount = discount * 100;
    return amount / total;
  }

  RemoveBg removeBg = RemoveBg(); // getUiImage(String img) async {
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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final ThemeData color = Theme.of(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProductProvider()..specialOffer(),
      child: Consumer<ProductProvider>(builder:
          (BuildContext context, ProductProvider special, Widget? child) {
        final List<ProductModel> products =
            special.specialProducts.reversed.toList();
        return special.specialProducts.isEmpty
            ? const CircularProgressIndicator()
            : Container(
                height: height * .25,
                width: width,
                decoration: BoxDecoration(
                  color: color.hoverColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: CarouselSlider.builder(
                    unlimitedMode: true,
                    slideBuilder: (int index) {
                      // getUiImage(products[index].image!);
                      // pngBytes = cutImage(context: context, image: image!);
                      // setState(() {});

                      return GestureDetector(
                        onTap: () {
                          removeBg.remove(
                            products[index].image![0],
                          );
                        },
                        child: SizedBox(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 15.h),
                                width: width * .45,
                                height: height * .25,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      '${discout(products[index].price!, products[index].discount!).toStringAsFixed(2)}%',
                                      style: GoogleFonts.poppins(
                                        textStyle: heading2(context).copyWith(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      "Today's special!",
                                      style: GoogleFonts.poppins(
                                        textStyle:
                                            bodySmallBoldText(context).copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      'Get discount for every order. Only for today',
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
                              Image.network(
                                products[index].image![0],
                                height: height * .2,
                                width: width * .4,
                                fit: BoxFit.fitWidth,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    // slideTransform: CubeTransform(),
                    slideIndicator: CircularSlideIndicator(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      itemSpacing: 10,
                      indicatorRadius: 4,
                      currentIndicatorColor: color.primaryColor.withOpacity(.7),
                      indicatorBackgroundColor: color.primaryColor.withOpacity(
                        .5,
                      ),
                    ),
                    itemCount: products.length),
              );
      }),
    );
  }
}
