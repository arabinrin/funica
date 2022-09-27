import 'package:funica/presentations/registration/set_fingerprint.dart';
import 'package:funica/utils/navigator.dart';
import 'package:funica/widgets/button.dart';
import 'package:otp_text_field/otp_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/utils/small_widgets/arrow.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/style.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final color = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.r),
        height: height,
        width: width,
        child: SingleChildScrollView(
          // controller: controller,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const ArrowBack(),
                  Text(
                    'Create New PIN',
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
                height: 70.h,
                child: OTPTextField(
                  obscureText: true,
                  length: 4,
                  outlineBorderRadius: 15.r,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 65.w,
                  style: GoogleFonts.dmSans(
                      textStyle: bodyNormalBoldText(context)),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {},
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              InkWell(
                  onTap: () {
                    changeScreenReplacement(context, const Finngerprint());
                  },
                  child: Button(
                      title: ' Continue ',
                      color: color.primaryColor,
                      textcolor: color.backgroundColor))
            ],
          ),
        ),
      ),
    ));
  }
}
