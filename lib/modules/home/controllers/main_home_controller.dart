import 'package:attendance_app/modules/home/views/attendance/view/attendance.dart';
import 'package:attendance_app/modules/home/views/profile/view/profile.dart';
import 'package:get/get.dart';

class MainHomeController extends GetxController {
  final currantIndex = 0.obs;
  final homeViews = [
    ProfileView(),
    AttendanceView(),
  ];
  final homeViewsTitles = [
    "بياناتك",
    "التحضير",
  ];
}
