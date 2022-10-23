import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/presentations/auths/email_signIn.dart';
import 'package:funica/repository/auth_repository.dart';
import 'package:funica/utils/navigator.dart';
import 'package:funica/utils/small_widgets/arrow.dart';
import 'package:funica/utils/small_widgets/divider.dart';
import 'package:funica/utils/small_widgets/logo.dart';
import 'package:funica/utils/small_widgets/logo_button.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:funica/widgets/button.dart';
import 'package:funica/widgets/custom_textfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
class EmailLogIn extends StatefulWidget {
  EmailLogIn({Key? key}) : super(key: key);

  @override
  State<EmailLogIn> createState() => _EmailLogInState();
}

class _EmailLogInState extends State<EmailLogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _loadingState = false;
  final authrepository = AuthRepository();

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
          backgroundColor: Colors.white,
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
                Text('Login to Your Account',
                    style: GoogleFonts.poppins(
                      textStyle: heading2(context),
                    )),
                SizedBox(height: 30.h),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                          validator: (value) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = RegExp(pattern.toString());
                            if (!regex.hasMatch(value!)) {
                              return 'Invalid email address';
                            } else {
                              return null;
                            }
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          inputAction: TextInputAction.done,
                          label: '',
                          icon: const Icon(Icons.email_rounded),
                          hint: 'Email'),
                      CustomFormField(
                          validator: (value) {
                            if (value!.length < 8) {
                              return 'Password cannot be less than 8 characters';
                            } else {
                              return null;
                            }
                          },
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
                      if (!_loadingState)
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _loadingState = true;
                              });
                              await Future.value(
                                authrepository.signInWithEmail(
                                  emailController.text.trim(),
                                  passwordController.text,
                                  context,
                                  // fullName.text.trim().split(' ')[0],
                                  // fullName.text.trim().split(' ')[1],
                                  // phone.text,
                                ),
                              );
                              setState(() {
                                _loadingState = false;
                              });
                            }
                          },
                          child: Button(
                              title: 'Sign in',
                              color: color.primaryColor,
                              textcolor: color.backgroundColor),
                        ),
                      if (_loadingState)
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: LoadingIndicator(
                              indicatorType: Indicator.ballSpinFadeLoader,
                              colors: [
                                color.primaryColor,
                                Colors.grey,
                                color.primaryColor.withOpacity(.5),
                              ],
                              strokeWidth: 4,
                              pathBackgroundColor: color.primaryColor),
                        ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    
                  },
                  child: Text(
                    'Forgot the password?',
                    style: GoogleFonts.poppins(
                        textStyle: bodySmallBoldText(context)),
                  ),
                ),
                SizedBox(height: 20.h),
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
                      onTap: () => changeScreen(context, EmailSignIn()),
                      child: Text(
                        ' Sign up ',
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
