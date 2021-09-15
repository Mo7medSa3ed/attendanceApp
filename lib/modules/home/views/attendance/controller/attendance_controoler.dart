import 'package:get/get.dart';

class AttendanceController extends GetxController {
  String selectDate = "";

  List<dynamic> attendanceList = [];
  List<dynamic> filterAttendanceList = [];

  changeSelectDate(date) {
    selectDate = date;
    if (selectDate.trim().isEmpty) return;
    filterAttendanceList = attendanceList
        .where((e) => e['day'].substring(0, 10) == selectDate.substring(0, 10))
        .toList();
    update();
  }

  initializeLists(list) {
    attendanceList = list ?? [];
    filterAttendanceList = attendanceList;
  }
}
