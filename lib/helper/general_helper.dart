import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:attendance_app/config/constants.dart';

class GeneralHelper {
  static dynamic showLoading(BuildContext context) {
    return CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
      loopAnimation: true,
      animType: CoolAlertAnimType.scale,
      text: "Loading please wait.....",
    );
  }

  static dynamic showConfirmDialog(BuildContext context, {title, desc, onTap}) {
    return CoolAlert.show(
        context: context,
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

  static dynamic showSuccessDialog(BuildContext context, {title, desc}) {
    return CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        loopAnimation: true,
        animType: CoolAlertAnimType.scale,
        showCancelBtn: true,
        text: desc ?? '',
        title: title ?? '');
  }

  static dynamic showErrorDialog(BuildContext context, {title, desc}) {
    return CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      loopAnimation: true,
      animType: CoolAlertAnimType.scale,
      title: title ?? 'Error',
      text: desc ?? 'Something went wrong',
    );
  }

  static void displayErrorDialog(
      {String title = 'Error', String description = 'Something went wrong'}) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(kdefultpadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            SizedBox(
              height: 10,
            ),
            Text(description),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen ?? false) Get.back();
                },
                child: Text('OK'))
          ],
        ),
      ),
    ));
  }
}
