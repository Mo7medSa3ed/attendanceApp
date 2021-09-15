import 'package:attendance_app/api/controllers/api_controller.dart';
import 'package:attendance_app/helper/general_helper.dart';
import 'package:get/get.dart';

class QrController extends GetxController {
  List<dynamic> resultList = [];

  saveStudantData(code, title) {
    final idx = resultList.indexWhere((e) => e['email'] == code.trim());
    if (idx == -1) {
      resultList
          .add({'email': code.trim(), 'hour': GeneralHelper.getTimeNow()});

      GeneralHelper.showSnackBarForAttendance(title.replaceAll('ال', ""));
    }
  }

  savaAttendanceOrCheckout({isAttendance = true}) async {
    var list = resultList;
    final data = {
      "day": DateTime.now().toLocal().toString().substring(0, 10),
      "users": list
          .map((e) => {
                'email': e['email'].toString().split('/').first,
                'hour': e['hour']
              })
          .toList()
    };
    final response = await Get.put(ApiController())
        .saveAttendanceOrCheckout(data, isAttendance: isAttendance);
    if (response != null) {
      print(response);
      resetResult();
      GeneralHelper.showSuccessDialog(
          title: "تسجيل الطلاب",
          desc: "تم تسجيل الطلاب بنجاح",
          ontap: () {
            Get.back();
            Get.back();
            Get.back();
          });
    }
  }

  resetResult() {
    resultList.clear();
    update();
  }
}
