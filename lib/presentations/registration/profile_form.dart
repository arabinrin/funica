import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/presentations/registration/pin_screen.dart';
import 'package:funica/utils/navigator.dart';
import 'package:funica/utils/small_widgets/arrow.dart';
import 'package:funica/utils/small_widgets/svg.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:funica/widgets/button.dart';
import 'package:funica/widgets/custom_textfield.dart';
import 'package:funica/widgets/selector.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl/intl.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController nickName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController gender = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  String updateBirthDate = '';
  String phone = '';
  DateTime brithdayPick = DateTime.now();
  String dropdownvalue = 'Choose Gender';

  @override
  Widget build(BuildContext context) {
    String? formattedBirthDate = DateFormat('yyyy-MM-dd').format(brithdayPick);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final color = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                const ArrowBack(),
                Text(
                  'Fill Your Profile',
                  style: GoogleFonts.poppins(
                      textStyle: bodyNormalBoldText(context)),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 150.h,
              width: 150.h,
              child: Stack(
                children: [
                  Container(
                    height: 150.h,
                    width: 150.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.hoverColor,
                    ),
                    child: SvgImage(
                        name: 'assets/svgs/profile.svg',
                        height: 150.h,
                        width: 150.w),
                  ),
                  Positioned(
                      right: 10.w,
                      bottom: 10,
                      child: const Icon(Icons.camera_enhance)),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                        controller: fullName,
                        keyboardType: TextInputType.name,
                        inputAction: TextInputAction.done,
                        label: '',
                        hint: 'full Name'),
                    CustomFormField(
                        controller: nickName,
                        keyboardType: TextInputType.name,
                        inputAction: TextInputAction.done,
                        label: '',
                        hint: 'Nickname'),
                    CustomFormField(
                        readOnly: true,
                        controller: birthday,
                        keyboardType: TextInputType.datetime,
                        inputAction: TextInputAction.done,
                        label: '',
                        sufIcon: InkWell(
                            onTap: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: brithdayPick,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      primaryColor: Colors.black,
                                      buttonTheme: const ButtonThemeData(
                                          buttonColor: Colors.black,
                                          textTheme: ButtonTextTheme.primary),
                                      colorScheme: ColorScheme.light(
                                              primary: Colors.black,
                                              background: color.backgroundColor)
                                          .copyWith(
                                              secondary:
                                                  const Color(0xFF8CE7F1)),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if (newDate == null) return;
                              setState(() {
                                brithdayPick = newDate;
                              });
                            },
                            child: const Icon(Icons.calendar_month_rounded)),
                        hint: formattedBirthDate),
                    CustomFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        inputAction: TextInputAction.done,
                        label: '',
                        sufIcon: const Icon(Icons.email_rounded),
                        hint: 'Email'),
                    InternationalPhoneNumberInput(
                      initialValue: number,
                      textStyle: GoogleFonts.sourceSansPro(
                          color: color.primaryColor,
                          fontSize: 14.sp,
                          height: 22 / 14,
                          fontWeight: FontWeight.w600),
                      selectorTextStyle: GoogleFonts.sourceSansPro(
                          color: color.primaryColor,
                          fontSize: 14.sp,
                          height: 22 / 14,
                          fontWeight: FontWeight.w600),
                      //cursorColor: Colors.transparent,
                      selectorButtonOnErrorPadding: 10,
                      selectorConfig: const SelectorConfig(
                          setSelectorButtonAsPrefixIcon: true,
                          trailingSpace: false,
                          leadingPadding: 10,
                          selectorType: PhoneInputSelectorType.DROPDOWN),
                      onInputChanged: (num) {
                        //  dialCode = num.dialCode.toString();
                      },
                      textFieldController: userPhone,
                      inputDecoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: GoogleFonts.sourceSansPro(
                            color: color.primaryColor,
                            fontSize: 14.sp,
                            height: 22 / 14,
                            fontWeight: FontWeight.w600),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: color.hoverColor,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    CustomFormField(
                        controller: gender,
                        keyboardType: TextInputType.name,
                        inputAction: TextInputAction.done,
                        label: '',
                        readOnly: true,
                        sufIcon: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16),
                                    topLeft: Radius.circular(16),
                                  )),
                                  builder: (BuildContext context) =>
                                      DynamicSelector(
                                          header: 'Choose Your Gender',
                                          list: const [
                                            "Male",
                                            "Female",
                                            "Others"
                                          ])).then((value) {
                                // print(value);
                                setState(() {
                                  gender.text = value ?? '';
                                });
                              });
                            },
                            child: const Icon(Icons.arrow_drop_down)),
                        hint: 'gender'),
                    SizedBox(
                      height: 30.h,
                    ),
                    InkWell(
                      onTap: (() =>
                          changeScreen(context, const PinScreen())),
                      child: Button(
                          title: 'Continue',
                          color: color.primaryColor,
                          textcolor: color.backgroundColor),
                    )
                  ],
                ))
          ]),
        ),
      )),
    );
  }
}