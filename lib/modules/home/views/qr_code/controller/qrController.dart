import 'package:attendance_app/api/controllers/api_controller.dart';
import 'package:attendance_app/helper/general_helper.dart';
import 'package:get/get.dart';

class QrController extends GetxController {
  List<dynamic> resultList = [].obs;

  saveStudantData(code, title) {
    final idx = resultList.indexWhere((e) => e['email'] == code.trim());
    if (idx == -1) {
      resultList
          .add({'email': code.trim(), 'hour': GeneralHelper.getTimeNow()});

      GeneralHelper.showSnackBarForAttendance(title.replaceAll('ال', ""));
    }
  }

  savaAttendanceOrCheckout({isAttendance = true}) async {
    final data = {
      "day": DateTime.now().toLocal().toString(),
      "users": resultList
    };
    final response = await Get.put(ApiController())
        .saveAttendanceOrCheckout(data, isAttendance: isAttendance);
    if (response != null) {
      GeneralHelper.showSuccessDialog(
          title: "تسجيل الطلاب", desc: "تم تسجيل الطلاب بنجاح");
    }
  }

  resetResult() {
    resultList.clear();
  }
}
