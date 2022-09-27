import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/presentations/intro/welcome.dart';
import 'package:funica/presentations/intro/splash_screen.dart';
import 'package:funica/provider/theme_provider.dart';
import 'package:funica/utils/text_resourses/themes_util.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(value: DarkThemeProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  @override
  void initState() {
    getCurrentAppTheme();

    super.initState();
  }

  void getCurrentAppTheme() async {
        await themeChangeProvider.darkThemePreference.setDarkTheme(true);

    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    // final themeChange = Provider.of<DarkThemeProvider>(context);

    // var hour = DateTime.now().hour;
    // if (hour < 20 && hour > 6) {
    //   bool now = false;
    //   themeChange.darkTheme = now;
    // } else {
    //   bool now = true;
    //   themeChange.darkTheme = now;
    // }

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (BuildContext context, widget) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) {
                    return themeChangeProvider;
                  },
                )
              ],
              child: Consumer<DarkThemeProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  builder: (context, widget) {
                    // ScreenUtil.setContext(context);
                    return MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: widget!,
                    );
                  },
                  theme:
                      Styles.themeData(themeChangeProvider.darkTheme, context),

                  //
                  home: const AnimatedSplash(),
                );
              }),
            ));
  }
}

class AnimatedSplash extends StatelessWidget {
  static const route = '/AnimatedSplash';
  const AnimatedSplash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: MediaQuery.of(context).size.height,
      splash: const Splash(),
      nextScreen:const  Welcome(),
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType.scale,
      duration: 2000,
    );
  }
}
