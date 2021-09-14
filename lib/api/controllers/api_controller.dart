import 'package:attendance_app/api/controllers/handler_controller.dart';
import 'package:attendance_app/api/services/dio_client.dart';
import 'package:dio/dio.dart';

class ApiController with HandlerController {
  
  
  filterStudent(data) async {
    final response =
        await DioClient().post('/users/students', data).catchError(handleError);
    if (response == null) return;
    return response;
  }

  loginUser(user) async {
    final response =
        await DioClient().post('/users', user).catchError(handleError);
    if (response == null) return;
    return response;
  }

  uploadExcelFile(excelFile) async {
    final response = await DioClient()
        .post('/users/excel', FormData.fromMap({"xlsx": excelFile}))
        .catchError(handleError);
    if (response == null) return;
    return response;
  }

  saveAttendanceOrCheckout(data, {isAttendance = true}) async {
    final response = await DioClient()
        .post(
            '/users/attendance?type=${isAttendance ? "attendance" : "checkout"}',
            data)
        .catchError(handleError);
    if (response == null) return;
    return response;
  }
}
