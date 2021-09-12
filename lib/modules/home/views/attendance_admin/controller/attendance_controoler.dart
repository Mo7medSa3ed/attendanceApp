import 'package:get/get.dart';

class AttendanceAdminController extends GetxController {
  String selectDate = "";
  changeSelectDate(date) {
    selectDate = date;
    update();
  }

  List<dynamic> indexYearsList = ['الصف الأول'];
  List<dynamic> yearsList = ['الصف الأول', "الصف الثانى", "الصف الثالث"];
  List<dynamic> indexSectionsList = [1.1];
  List<dynamic> sectionsList = [1.1, 1.2, 1.3, 1.4, 1.5, 1.6];

  changeIndexYearsList(item) {
    if (indexYearsList.contains(item)) {
      indexYearsList.remove(item);
    } else {
      indexYearsList.add(item);
    }
    update();
  }

  changeindexSectionsList(item) {
    if (indexSectionsList.contains(item)) {
      indexSectionsList.remove(item);
    } else {
      indexSectionsList.add(item);
    }
    update();
  }
}
