import 'package:attendance_app/modules/home/views/attendance/view/attendance.dart';
import 'package:attendance_app/modules/home/views/attendance_admin/view/attendance_admin.dart';
import 'package:attendance_app/modules/home/views/profile/view/profile.dart';
import 'package:attendance_app/modules/home/views/profile_admin/view/profile_admin.dart';
import 'package:get/get.dart';

class MainHomeController extends GetxController {
  final currantIndex = 0.obs;
  
  final homeViews = [
    ProfileView(),
    AttendanceView(),
  ];
  final adminHomeViews = [
    ProfileAdminView(),
    AttendanceAdminView(),
  ];

  final homeViewsTitles = [
    "بياناتك",
    "التحضير",
  ];
  final adminHomeViewsTitles = [
    "بياناتك",
    "الدفتر",
  ];
}
