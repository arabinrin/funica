import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/presentations/auths/email_signIn.dart';
import 'package:funica/utils/navigator.dart';
import 'package:funica/utils/small_widgets/divider.dart';
import 'package:funica/widgets/auth_button.dart';
import 'package:funica/widgets/button.dart';
import 'package:funica/utils/small_widgets/arrow.dart';
import 'package:funica/utils/small_widgets/svg.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final color = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const ArrowBack(),
                SizedBox(
                  height: 20.sp,
                ),
                SizedBox(
                    height: 200.h,
                    width: 200.w,
                    child: SvgImage(
                      name: 'assets/svgs/auth.svg',
                      height: 150.h,
                      width: 150.w,
                    )),
                Text(
                  'Let\'s you in',
                  style: GoogleFonts.poppins(
                    textStyle: heading1(context),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                AuthButton(
                  image: 'assets/images/facebook.png',
                  title: 'Continue with Facebook',
                ),
                AuthButton(
                  image: 'assets/images/google.png',
                  title: 'Continue with Google',
                ),
                AuthButton(
                  image: 'assets/images/aplle.png',
                  title: 'Continue with Apple',
                ),
                SizedBox(
                  height: 25.h,
                ),
                DividerWithText(width: width * .4, text: 'or'),
                SizedBox(
                  height: 25.h,
                ),
                GestureDetector(
                  onTap: () => changeScreen(context, EmailSignIn()),
                  child: Button(
                      title: 'Sign in with password',
                      color: color.primaryColor,
                      textcolor: color.backgroundColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
