import 'package:attendance_app/api/controllers/api_controller.dart';
import 'package:get/get.dart';

class AttendanceAdminController extends GetxController {
  String selectDate = "";
  String selectTime = "";
  String selectedYear = "اﻷول الثانوي";
  List<dynamic> yearsList = [
    "اﻷول الثانوي",
    "الثانى الثانوي",
    "الثالث الثانوي",
  ];
  num selectedSection = 1.1;
  List<dynamic> sectionsList = [1.1, 1.2, 1.3, 1.4, 1.5, 1.6];
  List<dynamic> studentList = [];

  changeSelectDate(date) {
    selectDate = date;
    update();
  }

  changeSelectedYear(item) {
    selectedYear = item;
    update();
  }

  changeSelectedSection(item) {
    selectedSection = item;
    update();
  }

  filterStudent() async {
    if (selectDate.trim().isNotEmpty) {
      final data = {
        "classroom": selectedYear,
        "studyDivision": selectedSection.toString(),
        "day": selectDate.substring(0, 10)
      };

      final response = await Get.put(ApiController()).filterStudent(data);
      if (response != null) {
        studentList = response;
        update();
      }
    }
  }
}
