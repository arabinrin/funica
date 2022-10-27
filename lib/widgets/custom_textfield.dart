
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:funica/utils/text_resourses/app_textstyle.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
     TextEditingController? controller,
    FocusNode? focusNode,
    required TextInputType keyboardType,
    required TextInputAction inputAction,
    required String label,
    required String hint,
    //  required Function(String value) validator,
    this.isObscure = false,
    this.validator,
    this.readOnly = false,
    this.isCapitalized = false,
    this.icon,
    this.sufIcon,
    this.preIcon
  })  : _emailController = controller,
        _emailFocusNode = focusNode,
        _keyboardtype = keyboardType,
        _inputAction = inputAction,
        _hint = hint;

  final TextEditingController? _emailController;
  final FocusNode? _emailFocusNode;
  final TextInputType _keyboardtype;
  final TextInputAction _inputAction;
  final Widget? icon;
  final Widget? sufIcon;
    final Widget? preIcon;

  final String? Function(String?)?  validator;

  final String _hint;

  final bool isObscure;
  final bool readOnly;
  final bool isCapitalized;
//  final Function(String) _validator;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        color: color.hoverColor,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: TextFormField(
        
        validator:validator ,
        controller: _emailController,
        focusNode: _emailFocusNode,
        keyboardType: _keyboardtype,
        obscureText: isObscure,
        readOnly: readOnly,
        textCapitalization:
            isCapitalized ? TextCapitalization.words : TextCapitalization.none,
        textInputAction: _inputAction,
        cursorColor: color.primaryColor,
        // validator: (String? value) => _validator(value!),
        decoration: InputDecoration(
          prefixIcon: preIcon,
          suffixIcon: sufIcon,
          floatingLabelStyle: hintText(context),
          contentPadding:
              EdgeInsets.symmetric(vertical: 17.0.r, horizontal: 16.0.r),
          labelStyle: TextStyle(
            color: color.primaryColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          hintText: _hint,
          hintStyle: hintText(context),
          errorStyle: const TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: color.primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(
              color: Colors.redAccent,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(
              color: Colors.redAccent,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
