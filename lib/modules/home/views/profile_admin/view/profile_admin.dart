import 'dart:io';

import 'package:attendance_app/api/controllers/api_controller.dart';
import 'package:attendance_app/config/constants.dart';
import 'package:attendance_app/helper/general_helper.dart';
import 'package:attendance_app/modules/home/controllers/main_home_controller.dart';
import 'package:attendance_app/modules/home/views/qr_code/view/qrCode.dart';
import 'package:attendance_app/shared/widgets/primary_button.dart';
import 'package:attendance_app/shared/widgets/primary_text%20_header.dart';
import 'package:attendance_app/shared/widgets/primary_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAdminView extends StatelessWidget {
  final list = [
    "حضور الطلاب",
    "انصراف الطلاب",
  ];

  static MainHomeController mainHomeController = Get.find();

  @override
  Widget build(BuildContext context) {
    if (!list.contains("تحديث المستخدمين")) {
      list.add("تحديث المستخدمين");
    }
    // if (mainHomeController.email == 'teacher@gmail.com') {
    // }
    return Container(
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
            text: 'استاذ',
            color: kblack,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          Spacer(flex: 1),
          buildRow('البريد الالكترونى', 'admin@gmail.com'),
          Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                text: 'العمليات المتاحة',
                color: kblack,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(height: kdefultpadding),
          Wrap(
            spacing: 4,
            children: List.generate(
              list.length,
              (index) => SizedBox(
                child: PrimaryButton(
                  text: list[index],
                  radias: 100,
                  onTap: () async {
                    if (index == 0) {
                      Get.to(() => QRCodeView('الحضور'));
                    } else if (index == 1) {
                      Get.to(() => QRCodeView('الإنصراف'));
                    } else if (index == 2) {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(
                              type: FileType.custom,
                              allowMultiple: false,
                              allowedExtensions: ['xlsx', 'xls', 'ods']);

                      if (result != null) {
                        if (result.files.single.path.isExcelFileName) {
                          File file = File(result.files.single.path);
                          ApiController apiController = Get.find();
                          final response =
                              await apiController.uploadExcelFile(file);
                          if (response != null) {
                            return GeneralHelper.showSuccessDialog(
                                title: "تحديث المستخدمين",
                                desc: response['msg']);
                          }
                        }
                      }
                    }
                  },
                ),
              ),
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
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
