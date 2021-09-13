import 'package:get/get.dart';

class AttendanceAdminController extends GetxController {
  String selectDate = "";
  changeSelectDate(date) {
    selectDate = date;
    update();
  }

  String selectedYear = 'الصف الأول';
  List<dynamic> yearsList = ['الصف الأول', "الصف الثانى", "الصف الثالث"];
  num selectedSection = 1.1;
  List<dynamic> sectionsList = [1.1, 1.2, 1.3, 1.4, 1.5, 1.6];

  changeSelectedYear(item) {
    selectedYear = item;
    update();
  }

  changeSelectedSection(item) {
    selectedSection = item;
    update();
  }
}
