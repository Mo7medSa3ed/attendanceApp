import 'package:attendance_app/helper/binding.dart';
import 'package:attendance_app/modules/splash/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:attendance_app/config/constants.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      initialBinding: InitialBinding(),
      title: 'Flutter Demo',
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kwhite,
        fontFamily: 'Cairo',
        primaryColor: kprimary,
        accentColor: kprimary,
        colorScheme: ColorScheme.light(
          primary: kprimary,
          primaryVariant: kprimary,
          secondary: kprimary,
          secondaryVariant: kprimary,
          onPrimary: kwhite,
          onSecondary: kprimary,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: kblack),
      ),
      home: SplashView(),
    );
  }
}
