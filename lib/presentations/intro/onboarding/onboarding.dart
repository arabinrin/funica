import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funica/presentations/auths/Signup.dart';
import 'package:funica/presentations/auths/signin.dart';
import 'package:funica/widgets/button.dart';
import 'package:funica/presentations/intro/onboarding/onboard.dart';
import 'package:funica/utils/navigator.dart';
import 'package:funica/utils/small_widgets/svg.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B1 extends StatelessWidget {
  static const route = '/B1';
  B1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TheBoard(
      onBoardModel: onboardModels[0],
      current: 0,
      tap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
              opaque: true,
              transitionDuration: const Duration(milliseconds: 900),
              pageBuilder: (BuildContext context, _, __) {
                return B2();
              },
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }),
        );
      },
    );
  }
}

class B2 extends StatelessWidget {
  static const route = '/B2';
  B2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TheBoard(
      onBoardModel: onboardModels[1],
      current: 1,
      tap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
              opaque: true,
              transitionDuration: const Duration(milliseconds: 900),
              pageBuilder: (BuildContext context, _, __) {
                return B3();
              },
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }),
        );
      },
    );
  }
}

class B3 extends StatelessWidget {
  static const route = '/B2';
  B3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TheBoard(
      onBoardModel: onboardModels[2],
      current: 2,
      tap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
              opaque: true,
              transitionDuration: const Duration(milliseconds: 900),
              pageBuilder: (BuildContext context, _, __) {
                return const AuthScreen();
              },
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }),
        );
      },
    );
  }
}

class TheBoard extends StatelessWidget {
  const TheBoard({
    Key? key,
    this.onBoardModel,
    this.tap,
    this.current,
  }) : super(key: key);

  final VoidCallback? tap;
  final int? current;
  final OnBoardModel? onBoardModel;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final color = Theme.of(context);

    return Scaffold(
      backgroundColor: color.backgroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: height * .55,
                width: width,
                child: SvgImage(
                    name: onBoardModel!.image,
                    height: height * .55,
                    width: width),
              ),
              SizedBox(
                height: height * .25,
                child: Text(
                  onBoardModel!.name,
                  style: GoogleFonts.sourceSansPro(
                    textStyle: heading1(context),
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List.generate(3, (index) => buildDot(index, context)),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                  onTap: tap,
                  child: Button(
                    color: color.primaryColor,
                    textcolor: color.backgroundColor,
                    title: 'Next',
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
        final color = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 7,
      width: current == index ? 25 : 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: current == index ? color.primaryColor : Colors.grey.withOpacity(.5),
      ),
    );
  }
}
