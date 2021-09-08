import 'package:attendance_app/shared/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:attendance_app/modules/splash/controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) => Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: getScreanHeight(context) * 0.3,
                width: getScreanWeidth(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
