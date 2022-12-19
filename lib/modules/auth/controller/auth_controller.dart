import 'package:attendance_app/api/controllers/api_controller.dart';
import 'package:attendance_app/modules/home/main.dart';
import 'package:get/get.dart';
import 'package:attendance_app/modules/auth/model/user_model.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  late User loggedUser = User(email: '', admin: false);

  loginUser(User user) async {
    final response = await Get.put(ApiController()).loginUser(user.toJson());
    if (response != null) {
      loggedUser = User.fromJson(response['user']);
      GetStorage().write('token', response['token']);
      Get.offAll(() => MainHome());
    }
  }
}
