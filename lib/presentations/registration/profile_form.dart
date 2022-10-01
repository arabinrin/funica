import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/models/user_model.dart';
import 'package:funica/presentations/registration/set_fingerprint.dart';
import 'package:funica/repository/database.dart';
import 'package:funica/repository/profile_repository.dart';
import 'package:funica/utils/navigator.dart';
import 'package:funica/utils/small_widgets/arrow.dart';
import 'package:funica/utils/small_widgets/snackbar.dart';
import 'package:funica/utils/small_widgets/svg.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:funica/widgets/button.dart';
import 'package:funica/widgets/custom_textfield.dart';
import 'package:funica/widgets/selector.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl/intl.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  DatabaseMethods databaseMethods = DatabaseMethods();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController genderControlller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  String updateBirthDate = '';
  String phone = '';
  DateTime brithdayPick = DateTime.now();
  String dropdownvalue = 'Choose Gender';

  final formrepository = ProfileRespository();
  String? pic;
  String? email;
  String? username;
  bool loading = false;

  @override
  void initState() {
    emailController.text = FirebaseAuth.instance.currentUser!.email!;
    pic = FirebaseAuth.instance.currentUser!.photoURL;
    nickNameController.text = FirebaseAuth.instance.currentUser!.displayName!;
    userInfo();

    super.initState();
  }

  userInfo() async {
    await databaseMethods
        .getUserdataById(FirebaseAuth.instance.currentUser!.uid)
        .then((snapshot) {
      if (snapshot != null) {
        setState(() {
          birthdayController.text = snapshot['birthday'];
          genderControlller.text = snapshot['gender'];
          userPhoneController.text = snapshot['phone'];
          fullNameController.text = snapshot['fullName'];
        });
      } else {
        setState(() {
          final snackBar = SnackBar(content: Text('Error geting user profile'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }
    });
  }

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
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        formrepository.pickImage(context);
                        setState(() {});
                      },
                      child: SizedBox(
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
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: pic != null ? pic! : '',
                                  placeholder: (context, url) => SvgImage(
                                      name: 'assets/svgs/profile.svg',
                                      height: 150.h,
                                      width: 150.w),
                                  errorWidget: (context, url, error) =>
                                      SvgImage(
                                          name: 'assets/svgs/profile.svg',
                                          height: 150.h,
                                          width: 150.w),
                                ),
                              ),
                            ),
                            Positioned(
                                right: 10.w,
                                bottom: 10,
                                child: const Icon(Icons.camera_enhance)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomFormField(
                        validator: (value) {
                          if (value!.contains(' ')) {
                            return null;
                          } else {
                            return 'I has to be your full name';
                          }
                        },
                        controller: fullNameController,
                        keyboardType: TextInputType.name,
                        inputAction: TextInputAction.done,
                        label: '',
                        hint: 'full Name'),
                    CustomFormField(
                        controller: nickNameController,
                        keyboardType: TextInputType.name,
                        inputAction: TextInputAction.done,
                        label: '',
                        hint: 'Nickname'),
                    CustomFormField(
                        readOnly: true,
                        controller: birthdayController,
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
                        controller: emailController,
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
                      textFieldController: userPhoneController,
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
                        controller: genderControlller,
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
                                  genderControlller.text = value ?? '';
                                });
                              });
                            },
                            child: const Icon(Icons.arrow_drop_down)),
                        hint: 'gender'),
                    SizedBox(
                      height: 30.h,
                    ),
                    if (loading)
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
                    if (!loading)
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            UserDetail userDetail = UserDetail(
                              email: emailController.text,
                              fName: fullNameController.text,
                              nickname: nickNameController.text,
                              birthday: formattedBirthDate,
                              gender: genderControlller.text,
                              phoneNum: userPhoneController.text,
                              imgUrl: pic,
                            );
                            print(userDetail);
                            formrepository.editUserInfo(userDetail);
                            cToast(msg: "Profile Updated", context: context);

                            changeScreenReplacement(
                                context, const Finngerprint());
                          } else {
                            cToast(msg: 'Error', context: context);
                          }
                        },

                        // (() => changeScreen(context, const PinScreen())),
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
