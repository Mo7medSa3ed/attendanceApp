import 'package:attendance_app/api/controllers/api_controller.dart';
import 'package:attendance_app/modules/auth/controller/auth_controller.dart';
import 'package:attendance_app/modules/home/controllers/main_home_controller.dart';
import 'package:attendance_app/modules/splash/controller/splash_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<MainHomeController>(() => MainHomeController());
    Get.lazyPut<ApiController>(() => ApiController());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
