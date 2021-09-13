import 'package:attendance_app/config/constants.dart';
import 'package:attendance_app/modules/home/controllers/main_home_controller.dart';
import 'package:attendance_app/modules/home/main.dart';
import 'package:attendance_app/shared/widgets/custum_textfield.dart';
import 'package:attendance_app/shared/widgets/primary_button.dart';
import 'package:attendance_app/shared/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/shared/functions/functions.dart';
import 'package:get/get.dart';

class AuthView extends StatelessWidget {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(kdefultpadding * 2),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PrimaryText(
                  text: 'تسجيل دخول',
                  color: kblack,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0,
                ),
                Image.asset(
                  "assets/images/login.jpg",
                  height: getScreanHeight(context) * 0.4,
                  width: double.infinity,
                ),
                SizedBox(height: kdefultpadding),
                CustumTextField(
                  controller: _emailController,
                  hint: 'البريد الالكترونى',
                  validator: (v) {
                    return (v.toString().isEmpty || v == null)
                        ? 'البريد الالكترونى مطلوب !'
                        : !GetUtils.isEmail(v.toString())
                            ? 'البريد غير صحيح!!'
                            : null;
                  },
                ),
                SizedBox(height: kdefultpadding * 3),
                SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                        text: 'تسجيل دخول',
                        onTap: () {
                          Get.put(MainHomeController()).email =
                              _emailController.text.trim();
                          Get.to(() => MainHome());
                        }))
              ]),
        ),
      ),
    ));
  }
}
