import 'package:attendance_app/api/controllers/handler_controller.dart';
import 'package:attendance_app/api/services/dio_client.dart';

class ApiController with HandlerController {
  getData() async {
    final response = await DioClient().get('/pos').catchError(handleError);
    if (response == null) return;
    return response;
  }

  postData(data) async {
    final response =
        await DioClient().post('/posts', data).catchError(handleError);
    if (response == null) return;
    return response;
  }
}
