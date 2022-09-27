import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/presentations/auths/login.dart';
import 'package:funica/presentations/registration/profile_form.dart';
import 'package:funica/utils/navigator.dart';
import 'package:funica/utils/small_widgets/arrow.dart';
import 'package:funica/utils/small_widgets/divider.dart';
import 'package:funica/utils/small_widgets/logo.dart';
import 'package:funica/utils/small_widgets/logo_button.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:funica/widgets/button.dart';
import 'package:funica/widgets/custom_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
class EmailSignIn extends StatefulWidget {
  EmailSignIn({Key? key}) : super(key: key);

  @override
  State<EmailSignIn> createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool check = false;
  bool obscure = true;

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
            padding: EdgeInsets.all(20.r),
            child: SingleChildScrollView(
              child: Column(children: [
                const ArrowBack(),
                SizedBox(height: 30.h),
                Logo(back: color.backgroundColor, line: color.primaryColor),
                SizedBox(height: 20.h),
                Text('Create Your Account',
                    style: GoogleFonts.poppins(
                      textStyle: heading2(context),
                    )),
                SizedBox(height: 30.h),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          inputAction: TextInputAction.done,
                          label: '',
                          icon: const Icon(Icons.email_rounded),
                          hint: 'Email'),
                      CustomFormField(
                          isObscure: obscure,
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          inputAction: TextInputAction.done,
                          label: '',
                          icon: const Icon(
                            Icons.lock,
                          ),
                          sufIcon: InkWell(
                            onTap: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                            child: obscure
                                ? const Icon(
                                    Icons.remove_red_eye,
                                  )
                                : const Icon(Icons.hide_image),
                          ),
                          hint: 'Password'),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        activeColor: color.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        value: check,
                        onChanged: (bool? checked) {
                          setState(() {
                            check = checked!;
                          });
                        }),
                    Text('Remember me',
                        style: GoogleFonts.poppins(
                          textStyle: bodySmallBoldText(context),
                        )),
                  ],
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () => changeScreenReplacement(context, ProfileForm()),
                  child: Button(
                      title: 'Sign up',
                      color: color.primaryColor,
                      textcolor: color.backgroundColor),
                ),
                SizedBox(height: 40.h),
                DividerWithText(width: width * .25, text: 'or continue with'),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    LogoButton(image: 'assets/images/facebook.png'),
                    LogoButton(image: 'assets/images/google.png'),
                    LogoButton(image: 'assets/images/aplle.png'),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: GoogleFonts.poppins(textStyle: hintText(context)),
                    ),
                    InkWell(
                      onTap: (() => changeScreen(context, EmailLogIn())),
                      child: Text(
                        ' Sign in ',
                        style: GoogleFonts.poppins(
                            textStyle: bodySmallBoldText(context)),
                      ),
                    )
                  ],
                )
              ]),
            ),
          )),
    );
  }
}