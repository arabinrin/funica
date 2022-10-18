import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/presentations/home/home_page.dart';
import 'package:funica/presentations/home/page_view.dart';
import 'package:funica/presentations/intro/welcome.dart';
import 'package:funica/presentations/intro/splash_screen.dart';
import 'package:funica/presentations/registration/set_fingerprint.dart';
import 'package:funica/provider/theme_provider.dart';
import 'package:funica/provider/user_provider.dart';
import 'package:funica/repository/auth_repository.dart';
import 'package:funica/repository/profile_repository.dart';
import 'package:funica/repository/storage_service.dart';
import 'package:funica/repository/user_prefs.dart';
import 'package:funica/utils/text_resourses/themes_util.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(value: DarkThemeProvider()),
      ChangeNotifierProvider.value(value: UserInfomation()),
      ChangeNotifierProvider.value(value: Storaged()),
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

  bool period() {
    var hour = DateTime.now().hour;
    if (hour < 20 && hour > 6) {
      return false;
    } else {
      return true;
    }
  }

  void getCurrentAppTheme() async {
    await themeChangeProvider.darkThemePreference.setDarkTheme(period());

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
                  home: AnimatedSplash(),
                );
              }),
            ));
  }
}

class AnimatedSplash extends StatelessWidget {
  static const route = '/AnimatedSplash';
  AnimatedSplash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage = Storage();

    return AnimatedSplashScreen(
      splashIconSize: MediaQuery.of(context).size.height,
      splash: const Splash(),
      nextScreen: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              bool isBio = storage.box.read('bioDataStatus') ?? false;
              print(isBio);
              return isBio ? const Finngerprint() : const PageViewScreen();
            } else {
              return const Welcome();
            }
          }),
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType.scale,
      duration: 2000,
    );
  }
}
