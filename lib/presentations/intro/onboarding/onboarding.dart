import 'package:flutter/material.dart';
import 'package:funica/presentations/auths/signin.dart';
import 'package:funica/widgets/button.dart';
import 'package:funica/presentations/intro/onboarding/onboard.dart';
import 'package:funica/utils/small_widgets/svg.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';

class B1 extends StatelessWidget {
  const B1({super.key});
  static const String route = '/B1';

  @override
  Widget build(BuildContext context) {
    return TheBoard(
      onBoardModel: onboardModels[0],
      current: 0,
      tap: () {
        Navigator.of(context).push(
          PageRouteBuilder<dynamic>(
              transitionDuration: const Duration(milliseconds: 900),
              pageBuilder: (BuildContext context, _, __) {
                return const B2();
              },
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },),
        );
      },
    );
  }
}

class B2 extends StatelessWidget {
  const B2({super.key});
  static const String route = '/B2';

  @override
  Widget build(BuildContext context) {
    return TheBoard(
      onBoardModel: onboardModels[1],
      current: 1,
      tap: () {
        Navigator.of(context).push(
          PageRouteBuilder<dynamic>(
              transitionDuration: const Duration(milliseconds: 900),
              pageBuilder: (BuildContext context, _, __) {
                return const B3();
              },
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },),
        );
      },
    );
  }
}

class B3 extends StatelessWidget {
  const B3({super.key});
  static const String route = '/B2';

  @override
  Widget build(BuildContext context) {
    return TheBoard(
      onBoardModel: onboardModels[2],
      current: 2,
      tap: () {
        Navigator.of(context).push(
          PageRouteBuilder<dynamic>(
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
              },),
        );
      },
    );
  }
}

class TheBoard extends StatelessWidget {
  const TheBoard({
    super.key,
    this.onBoardModel,
    this.tap,
    this.current,
  });

  final VoidCallback? tap;
  final int? current;
  final OnBoardModel? onBoardModel;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final ThemeData color = Theme.of(context);

    return Scaffold(
      backgroundColor: color.backgroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: height * .55,
                width: width,
                child: SvgImage(
                    name: onBoardModel!.image,
                    height: height * .55,
                    width: width,),
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
                      List.generate(3, (int index) => buildDot(index, context)),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    final ThemeData color = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 7,
      width: current == index ? 25 : 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:
            current == index ? color.primaryColor : Colors.grey.withOpacity(.5),
      ),
    );
  }
}
