import 'package:get/get.dart';

class AttendanceController extends GetxController {
  String selectDate = "";
  changeSelectDate(date) {
    selectDate = date;
    update();
  }
}
