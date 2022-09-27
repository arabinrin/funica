import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/provider/theme_provider.dart';
import 'package:funica/utils/navigator.dart';
import 'package:funica/utils/small_widgets/arrow.dart';
import 'package:funica/utils/small_widgets/svg.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:funica/widgets/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:local_auth/local_auth.dart';

class Finngerprint extends StatefulWidget {
  const Finngerprint({Key? key}) : super(key: key);

  @override
  State<Finngerprint> createState() => _FinngerprintState();
}

class _FinngerprintState extends State<Finngerprint> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  @override
  void initState() {
    getCurrentAppMode();
    _checkBiometric();
    _getAvailableBiometric();

    super.initState();
  }

  void getCurrentAppMode() async {
    isDark = await themeChangeProvider.darkThemePreference.getTheme();
  }

  bool isDark = false;
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  bool isAuthenticated = false;
  final storedPasscode = '1234';

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric = true;
  List<BiometricType> _availableBiometric = [];
  String authorized = "Not authorized";

  Future<void> _checkBiometric() async {
    late bool canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future<void> _getAvailableBiometric() async {
    late List<BiometricType> availableBiometric;
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: "Scan your finger to authenticate",
        // useErrorDialogs: true,
        // stickyAuth: false,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      authorized = authenticated ? "Authorized" : " to authenticate";
      print(authorized);
      if (authenticated) {
        Future.delayed(Duration(milliseconds: 100), () {
          showDialog(context: context, builder: (context) => EmotionsForm());
        });
        changeScreenReplacement(context, const Finngerprint());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final color = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const ArrowBack(),
                    Text(
                      'Set Your Fingerprint',
                      style: GoogleFonts.poppins(
                          textStyle: bodyNormalBoldText(context)),
                    )
                  ],
                ),
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  'Add a PIN to make your account more secure',
                  style: GoogleFonts.poppins(textStyle: bodyNormalText(context)),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  height: 250.h,
                  width: 200.w,
                  child: SvgImage(
                      name: isDark
                          ? 'assets/svgs/ingerwhaite.svg'
                          : 'assets/svgs/fingerdark.svg',
                      height: height,
                      width: width),
                ),
                Text(
                  'Please put your finger on the fingerprint scanner to get started',
                  style: GoogleFonts.poppins(textStyle: bodyNormalText(context)),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width / 2.5,
                      child: Button(
                          title: 'Skip',
                          color: color.hoverColor,
                          textcolor: color.primaryColor),
                    ),
                    SizedBox(
                      width: width / 2.5,
                      child: InkWell(
                        onTap: _authenticate,
                        child: Button(
                            title: 'Continue',
                            color: color.primaryColor,
                            textcolor: color.backgroundColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmotionsForm extends StatefulWidget {
  EmotionsForm({
    Key? key,
  }) : super(key: key);

  @override
  State<EmotionsForm> createState() => _EmotionsFormState();
}

class _EmotionsFormState extends State<EmotionsForm> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    getCurrentAppMode();

    super.initState();
  }

  void getCurrentAppMode() async {
    isDark = await themeChangeProvider.darkThemePreference.getTheme();
  }

  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final color = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.r),
        ),
      ),
      elevation: 0,
      backgroundColor: color.hoverColor,
      child: Container(
        width: 332.w,
        height: height * .6,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgImage(
                    name: isDark
                        ? 'assets/svgs/doneblack.svg'
                        : 'assets/svgs/donewhite.svg',
                    height: 250.h,
                    width: 250.w),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Cogratulations!',
                  style: GoogleFonts.poppins(textStyle: smallHeading(context)),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Your account i ready to use. You will be redirected to the Homepage in a few aeconds',
                  style: GoogleFonts.poppins(textStyle: bodySmallText(context)),
                  maxLines: 4,
                  textAlign: TextAlign.center,
                ),
                  SizedBox(
                  height: 20.h,
                ),
                 SizedBox(
              height: 50.h,
              width: 50.w,
              child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,
                  colors: [
                    color.primaryColor,
                    Colors.grey,
                    color.primaryColor.withOpacity(.5),
                  ],
                  strokeWidth: 4,
                  pathBackgroundColor: color.primaryColor),
            )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
