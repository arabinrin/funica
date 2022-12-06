import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funica/presentations/home/category_grid.dart';
import 'package:funica/presentations/home/popular_products.dart';

import 'package:funica/presentations/home/special_offer.dart';
import 'package:funica/presentations/services/notification.dart';
import 'package:funica/utils/navigator.dart';
import 'package:funica/utils/small_widgets/heading.dart';
import 'package:funica/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/provider/user_provider.dart';
import 'package:funica/utils/small_widgets/svg.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController search = TextEditingController();
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    final color = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Consumer<UserInfomation>(builder: (context, getInfo, child) {
          getInfo.userInfo();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(children: [
                      Container(
                        height: 40.h,
                        width: 40.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: color.highlightColor),
                          shape: BoxShape.circle,
                          color: color.hoverColor,
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                FirebaseAuth.instance.currentUser!.photoURL!,
                            placeholder: (context, url) => SvgImage(
                                name: 'assets/svgs/profile.svg',
                                height: 40.h,
                                width: 40.w),
                            errorWidget: (context, url, error) => SvgImage(
                                name: 'assets/svgs/profile.svg',
                                height: 40.h,
                                width: 40.w),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            greeting(),
                            style: GoogleFonts.poppins(
                                    textStyle: bodySmallText(context))
                                .copyWith(color: color.highlightColor),
                          ),
                          Text(
                            getInfo.name,
                            style: GoogleFonts.poppins(
                              textStyle: bodySmallBoldText(context),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              changeScreen(context, const NoficationPage());
                            },
                            child: Icon(
                              Icons.notifications_outlined,
                              size: 25.r,
                              color: color.highlightColor,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Icon(
                            Icons.favorite_outline_rounded,
                            size: 25.r,
                            color: color.highlightColor,
                          ),
                        ],
                      ))
                    ]),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomFormField(
                      preIcon: const Icon(Icons.search_rounded),
                      sufIcon: const Icon(Icons.menu),
                      controller: search,
                      keyboardType: TextInputType.name,
                      inputAction: TextInputAction.search,
                      label: '',
                      hint: 'Search',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Heading(
                      category: 'Special Offers',
                      option: 'See All',
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SpecialOffer(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CategoryGrid(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Heading(
                      category: 'Most Popular',
                      option: 'See All',
                    ),
                  ),
                  const PopularProducts(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
