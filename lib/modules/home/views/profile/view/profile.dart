import 'dart:io';

import 'package:attendance_app/config/constants.dart';
import 'package:attendance_app/modules/auth/controller/auth_controller.dart';
import 'package:attendance_app/shared/functions/functions.dart';
import 'package:attendance_app/shared/widgets/primary_button.dart';
import 'package:attendance_app/shared/widgets/primary_text%20_header.dart';
import 'package:attendance_app/shared/widgets/primary_text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

// ignore: must_be_immutable
class ProfileView extends StatelessWidget {
  static final ScreenshotController _screenshotController =
      ScreenshotController();
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Screenshot(
        controller: _screenshotController,
        child: Container(
          color: kwhite,
          padding: const EdgeInsets.symmetric(
              vertical: kdefultpadding * 2, horizontal: kdefultpadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PrimaryHeaderText(
                text: 'بياناتك',
              ),
              Spacer(flex: 1),
              PrimaryText(
                text: authController.loggedUser.name ?? '',
                color: kblack,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
              PrimaryText(
                text: 'طالب',
                color: kblack,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              Spacer(flex: 1),
              buildRow(
                  'البريد الالكترونى', authController.loggedUser.email ?? ''),
              buildRow('الصف', authController.loggedUser.classroom ?? ''),
              buildRow(
                  'الشعبة', authController.loggedUser.studyDivision.toString()),
              Spacer(flex: 1),
              QrImage(
                data: authController.loggedUser.email.toString() +
                    '/' +
                    authController.loggedUser.name.toString(),
                version: QrVersions.auto,
                size: getScreanHeight(context) * 0.25,
              ),
              Spacer(flex: 1),
              SizedBox(
                width: getScreanWeidth(context) * 0.3,
                child: PrimaryButton(
                  text: "طباعة",
                  radias: 100,
                  onTap: () async {
                    if (await Permission.storage.isDenied)
                      await Permission.storage.request();
                    else {
                      final image = await _screenshotController.capture();
                      final path = "/storage/emulated/0/pictures";
                      File('$path/${authController.loggedUser.id}.jpg')
                          .writeAsBytes(image!);
                      // final res = await ImageGallerySaver.saveImage(
                      //     Uint8List.fromList(image!),
                      //     quality: 100,
                      //     name: authController.loggedUser.id);
                      // print(res);
                    }
                  },
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
        ));
  }

  Widget buildRow(key, value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: PrimaryText(
            text: key ?? '',
            color: kblack,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          flex: 2,
          child: PrimaryText(
            text: value ?? "",
            color: kblack,
            align: TextAlign.center,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
