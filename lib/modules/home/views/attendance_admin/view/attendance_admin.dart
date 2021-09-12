import 'package:attendance_app/config/constants.dart';
import 'package:attendance_app/modules/home/views/attendance_admin/controller/attendance_controoler.dart';
import 'package:attendance_app/modules/home/views/attendance_admin/view/components/attendance_card.dart';
import 'package:attendance_app/modules/home/views/attendance_admin/view/components/scroll_select.dart';
import 'package:attendance_app/shared/functions/functions.dart';
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
                            initialDate: controller.selectDate.trim().isEmpty
                                ? DateTime.now()
                                : DateTime.parse(controller.selectDate.trim()),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050),
                          ).then((value) {
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
                  PrimaryText(
                    text: 'الطلاب',
                    color: kbold,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(height: kdefultpadding / 2),
                ],
              )
            : AttendanceAdminCard(),
        itemCount: 50,
      ),
    );
  }
}
