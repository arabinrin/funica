import 'package:flutter/material.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
    this.category,
    this.option,
  }) : super(key: key);
  final String? category;
  final String? option;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category!,
          style: GoogleFonts.poppins(
            textStyle: bodySmallBoldText(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          option!,
          style: GoogleFonts.poppins(
            textStyle: bodyverySmallBoldText(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
