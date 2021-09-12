import 'package:attendance_app/config/constants.dart';
import 'package:attendance_app/modules/home/views/attendance_admin/controller/attendance_controoler.dart';
import 'package:attendance_app/shared/widgets/primary_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SelectScroll extends StatelessWidget {
  SelectScroll({this.title, this.listNeed = 1});
  final title;
  final listNeed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PrimaryText(
          text: title ?? '',
          color: kbold,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
        SizedBox(height: kdefultpadding / 2),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(
            listNeed == 1
                ? Get.put(AttendanceAdminController()).yearsList.length
                : Get.put(AttendanceAdminController()).sectionsList.length,
            (index) => GetBuilder<AttendanceAdminController>(
                init: AttendanceAdminController(),
                builder: (controller) {
                  bool isSelect = listNeed == 1
                      ? controller.indexYearsList
                          .contains(controller.yearsList[index])
                      : controller.indexSectionsList
                          .contains(controller.sectionsList[index]);

                  return Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: kdefultpadding / 4),
                    child: TextButton(
                      style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all(kblack),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(kdefultpadding / 2),
                                  side: isSelect
                                      ? BorderSide(width: 2, color: kprimary)
                                      : BorderSide.none)),
                          elevation: MaterialStateProperty.all(
                              isSelect ? kdefultpadding / 4 : 2),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: kdefultpadding / 2,
                                  vertical: kdefultpadding / 3)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[50])),
                      onPressed: () {
                        listNeed == 1
                            ? controller.changeIndexYearsList(
                                controller.yearsList[index])
                            : controller.changeindexSectionsList(
                                controller.sectionsList[index]);
                      },
                      child: PrimaryText(
                        text: listNeed == 1
                            ? controller.yearsList[index].toString()
                            : controller.sectionsList[index].toString(),
                        color: kblack,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }),
          )),
        ),
      ],
    );
  }
}
