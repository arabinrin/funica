import 'package:flutter/material.dart';
import 'package:funica/utils/small_widgets/logo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData color = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Logo(
                    back: color.primaryColor,
                    line: color.backgroundColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Funica',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: color.primaryColor,
                    ),),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
              width: 60,
              child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,
                  colors: [
                    color.primaryColor,
                    Colors.grey,
                    color.primaryColor.withOpacity(.5),
                  ],
                  strokeWidth: 4,
                  pathBackgroundColor: color.primaryColor,),
            )
          ],
        ),
      ),
    );
  }
}
