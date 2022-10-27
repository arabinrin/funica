import 'package:flutter/material.dart';
import 'package:funica/presentations/intro/onboarding/onboarding.dart';
import 'package:funica/utils/navigator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: InkWell(
      onTap: () => changeScreenReplacement(context, B1()),
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/welcomeFurn.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Container(
                height: height * .25,
                width: width * .9,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   
                    children: [
                      Text(
                        'Welcome to',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Funica',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'The best furniture e-commerce app of the century for your daily needs',
                        style: GoogleFonts.poppins(
                           textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),),
                        
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    ],),
              )
            ],
          ),
        ),
      ),
    ),);
  }
}
