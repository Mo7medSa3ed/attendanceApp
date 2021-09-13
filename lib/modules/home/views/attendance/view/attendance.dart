import 'package:attendance_app/config/constants.dart';
import 'package:attendance_app/modules/home/views/attendance/controller/attendance_controoler.dart';
import 'package:attendance_app/modules/home/views/attendance/view/components/attendance_card.dart';
import 'package:attendance_app/shared/functions/functions.dart';
import 'package:attendance_app/shared/widgets/primary_text%20_header.dart';
import 'package:attendance_app/shared/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceController>(
      init: AttendanceController(),
      builder: (controller) => ListView.builder(
        padding: const EdgeInsets.symmetric(
            vertical: kdefultpadding * 2, horizontal: kdefultpadding),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (ctx, index) => index == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryHeaderText(
                    text: 'التحضير',
                  ),
                  Container(
                      margin:
                          const EdgeInsets.symmetric(vertical: kdefultpadding),
                      width: getScreanWeidth(context) * 0.7,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: kblack, width: 1))),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () async {
                          await showDatePicker(
                                  context: context,
                                  initialDate:
                                      controller.selectDate.trim().isEmpty
                                          ? DateTime.now()
                                          : DateTime.parse(
                                              controller.selectDate.trim()),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050),
                                  cancelText: 'الغاء',
                                  confirmText: "تاكيد")
                              .then((value) {
                            if (value != null) {
                              controller.changeSelectDate(
                                  value.toString().substring(0, 10));
                            } else {
                              controller.changeSelectDate(value ?? '');
                            }
                          });
                        },
                        trailing: Icon(
                          Icons.calendar_today,
                          color: controller.selectDate.trim().isEmpty
                              ? kblack.withOpacity(0.7)
                              : Colors.black,
                        ),
                        dense: true,
                        title: PrimaryText(
                          fontWeight: FontWeight.w700,
                          text: controller.selectDate.trim().isEmpty
                              ? 'ابحث عن يوم'
                              : controller.selectDate,
                          color: controller.selectDate.trim().isEmpty
                              ? kblack.withOpacity(0.8)
                              : Colors.black,
                        ),
                      )),
                  SizedBox(height: kdefultpadding / 2),
                ],
              )
            : AttendanceCard(),
        itemCount: 50,
      ),
    );
  }
}
