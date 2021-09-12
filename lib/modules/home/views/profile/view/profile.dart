import 'dart:typed_data';

import 'package:attendance_app/config/constants.dart';
import 'package:attendance_app/shared/functions/functions.dart';
import 'package:attendance_app/shared/widgets/primary_button.dart';
import 'package:attendance_app/shared/widgets/primary_text%20_header.dart';
import 'package:attendance_app/shared/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class ProfileView extends StatelessWidget {
  static final ScreenshotController _screenshotController =
      ScreenshotController();
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
                text: 'محمد سعيد عليوة',
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
              buildRow('البريد الالكترونى', 'admin@gmail.com'),
              buildRow('الصف', 'الاول الثانوى'),
              buildRow('الشعبة', 'علوم'),
              Spacer(flex: 1),
              QrImage(
                data: 'admin@gmail.com',
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
                      String fileName =
                          DateTime.now().microsecondsSinceEpoch.toString();
                      final image = await _screenshotController.capture();
                      final result = await ImageGallerySaver.saveImage(
                          Uint8List.fromList(image!),
                          quality: 100,
                          name: fileName);
                      print(result);
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
