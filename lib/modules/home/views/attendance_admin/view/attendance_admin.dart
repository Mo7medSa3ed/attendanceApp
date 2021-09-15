import 'package:attendance_app/config/constants.dart';
import 'package:attendance_app/modules/home/views/attendance_admin/controller/attendance_controoler.dart';
import 'package:attendance_app/modules/home/views/attendance_admin/view/components/attendance_card.dart';
import 'package:attendance_app/modules/home/views/attendance_admin/view/components/scroll_select.dart';
import 'package:attendance_app/shared/functions/functions.dart';
import 'package:attendance_app/shared/widgets/primary_button.dart';
import 'package:attendance_app/shared/widgets/primary_text%20_header.dart';
import 'package:attendance_app/shared/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceAdminView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceAdminController>(
      init: AttendanceAdminController(),
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
                    text: 'الدفتر',
                  ),
                  SizedBox(height: kdefultpadding / 2),
                  SelectScroll(
                    title: 'اختر السنة',
                    listNeed: 1,
                  ),
                  SizedBox(height: kdefultpadding / 2),
                  SelectScroll(
                    title: 'اختر الشعبة',
                    listNeed: 2,
                  ),
                  SizedBox(height: kdefultpadding / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: kdefultpadding),
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
                                  controller.changeSelectDate(value.toString());
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
                                  : controller.selectDate.substring(0, 10),
                              color: controller.selectDate.trim().isEmpty
                                  ? kblack.withOpacity(0.8)
                                  : Colors.black,
                            ),
                          )),
                      PrimaryButton(
                          text: "بحث",
                          onTap: controller.selectDate.trim().isEmpty
                              ? null
                              : () async {
                                  await controller.filterStudent();
                                }),
                    ],
                  ),
                  SizedBox(height: kdefultpadding / 2),
                  PrimaryText(
                    text: 'الطلاب',
                    color: kbold,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(height: kdefultpadding / 2),
                  if (controller.studentList.length == 0)
                    SizedBox(
                      height: getScreanHeight(context) / 3,
                      child: Center(
                        child: PrimaryText(
                            fontWeight: FontWeight.w700,
                            text: "لا يوجد نتائج  ",
                            color: kblack),
                      ),
                    )
                ],
              )
            : AttendanceAdminCard(
                email: controller.studentList[index - 1]['email'],
                name: controller.studentList[index - 1]['name'],
                start: controller.studentList[index - 1]['attendance'][0]
                    ['attendance'],
                end: controller.studentList[index - 1]['attendance'][0]
                    ['checkout'],
              ),
        itemCount: controller.studentList.length + 1,
      ),
    );
  }
}
