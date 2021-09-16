import 'package:attendance_app/main.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:attendance_app/config/constants.dart';

class GeneralHelper {
  static dynamic showLoading() {
    return CoolAlert.show(
      context: navigatorKey.currentContext!,
      type: CoolAlertType.loading,
      loopAnimation: true,
      animType: CoolAlertAnimType.scale,
      text: "تحميل \nبرجاء الانتظار....",
    );
  }

  static dynamic showConfirmDialog(BuildContext context, {title, desc, onTap}) {
    return CoolAlert.show(
        context: navigatorKey.currentContext!,
        type: CoolAlertType.warning,
        loopAnimation: true,
        animType: CoolAlertAnimType.scale,
        onConfirmBtnTap: onTap,
        confirmBtnText: 'نعم',
        barrierDismissible: false,
        cancelBtnText: 'لا',
        confirmBtnColor: kprimary,
        onCancelBtnTap: () => Get.back(),
        showCancelBtn: true,
        text: desc ?? '',
        title: title ?? '');
  }

  static dynamic showSuccessDialog({title, desc, ontap}) {
    return CoolAlert.show(
        context: navigatorKey.currentContext!,
        type: CoolAlertType.success,
        loopAnimation: true,
        animType: CoolAlertAnimType.scale,
        showCancelBtn: true,
        cancelBtnText: 'الغاء',
        confirmBtnText: 'تم',
        onConfirmBtnTap: ontap,
        text: desc ?? '',
        title: title ?? '');
  }

  static dynamic showErrorDialog({title, desc}) {
    return CoolAlert.show(
      context: navigatorKey.currentContext!,
      type: CoolAlertType.error,
      loopAnimation: true,
      animType: CoolAlertAnimType.scale,
      cancelBtnText: 'الغاء',
      confirmBtnText: 'تم',
      title: title ?? 'خطأ',
      text: desc ?? 'حدث خطا فى شئ ما',
    );
  }

  static String getTimeNow() {
    final time = DateTime.now().toLocal();
    final hour = time.hour < 10 ? '0${time.hour}' : "${time.hour}";
    final minute = time.minute < 10 ? '0${time.minute}' : "${time.minute}";
    final second = time.second < 10 ? '0${time.second}' : "${time.second}";
    String formatedTime = "$hour:$minute:$second";
    return formatedTime;
  }

  static showSnackBarForAttendance(t) {
    final title = "$t" + "\t" + "الطلاب";
    final desc = "تم $t الطالب بنجاح";
    Get.snackbar(title, desc,
        isDismissible: true, snackPosition: SnackPosition.BOTTOM);
  }

  // static void displayErrorDialog(
  //     {String title = 'Error', String description = 'Something went wrong'}) {
  //   Get.dialog(Dialog(
  //     child: Padding(
  //       padding: const EdgeInsets.all(kdefultpadding),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(title),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           Text(description),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           ElevatedButton(
  //               onPressed: () {
  //                 if (Get.isDialogOpen ?? false) Get.back();
  //               },
  //               child: Text('OK'))
  //         ],
  //       ),
  //     ),
  //   ));
  // }
}
