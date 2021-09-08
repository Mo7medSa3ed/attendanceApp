import 'package:attendance_app/modules/auth/view/auth.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _fetchUserAndDetectAuth();
  }

  _fetchUserAndDetectAuth() {
    Future.delayed(Duration(seconds: 3))
        .then((value) => Get.to(() => AuthView()));
  }
}
