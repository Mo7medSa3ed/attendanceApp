import 'dart:async';
import 'dart:io';
import 'package:attendance_app/helper/general_helper.dart';
import 'package:dio/dio.dart';
import 'package:attendance_app/api/services/app_exceptions.dart';
import 'package:attendance_app/config/constants.dart';
import 'package:get/get.dart' as g;

class DioClient {
  static const int _TIME_OUT_DURATION = 20;

  Future<dynamic> get(String api) async {
    GeneralHelper.showLoading();
    final url = BASEURL + api;
    try {
      final response = await Dio()
          .get(url,
              options: Options(
                  headers: setHeaders(),
                  responseType: ResponseType.json,
                  followRedirects: false,
                  validateStatus: (status) {
                    return status! < 500;
                  }))
          .timeout(Duration(seconds: _TIME_OUT_DURATION));
      g.Get.back();
      return _processResponse(response);
    } on DioError catch (err) {
      _processError(err);
    } on SocketException {
      throw FetchDataException('No Internet Connection !!', url);
    } on TimeoutException {
      throw FetchDataException(
          'API not responded in time $_TIME_OUT_DURATION', url);
    }
  }

  Future<dynamic> post(String api, dynamic data) async {
    GeneralHelper.showLoading();
    final url = BASEURL + api;
    print(url);
    print(data);
    print(setHeaders());

    try {
      final response = await Dio()
          .post(url,
              data: data,
              options: Options(
                  headers: setHeaders(),
                  responseType: ResponseType.json,
                  followRedirects: false,
                  validateStatus: (status) {
                    return status! < 500;
                  }))
          .timeout(Duration(seconds: _TIME_OUT_DURATION));
      return _processResponse(response);
    } on DioError catch (err) {
      _processError(err);
    } on SocketException {
      throw FetchDataException('No Internet Connection !!', url);
    } on TimeoutException {
      throw FetchDataException(
          'API not responded in time $_TIME_OUT_DURATION', url);
    }
  }

  dynamic _processResponse(Response response) {
    g.Get.back();
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(
            response.statusMessage, response.requestOptions.path);
      case 401:
      case 403:
        throw UnAuthorizedException(
            response.statusMessage, response.requestOptions.path);
      case 500:
      default:
        throw FetchDataException(
            'Error some thing went error !!', response.requestOptions.path);
    }
  }

  dynamic _processError(DioError error) {
    g.Get.back();
    switch (error.type) {
      case DioErrorType.receiveTimeout:
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.cancel:
        throw FetchDataException(
            'API not responded in time $_TIME_OUT_DURATION',
            error.requestOptions.path);
      case DioErrorType.response:
        throw BadRequestException(error.message, error.requestOptions.path);
      case DioErrorType.other:
        throw FetchDataException(
            'Error some thing went error !!', error.requestOptions.path);
      default:
        throw FetchDataException(
            'Error some thing went error !!', error.requestOptions.path);
    }
  }
}
