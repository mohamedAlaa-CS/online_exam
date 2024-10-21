import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/model/request/signup_request_body.dart';
import 'package:online_exam/data/api/model/response/auth_response.dart';

import 'api_constants.dart';

@lazySingleton
class ApiManager {
  late Dio _dio;

  ApiManager() {
    _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
    _dio.options.headers['Content-Type'] = 'application/json';

    _dio.interceptors.add(LogInterceptor(
      responseHeader: true,
      requestHeader: true,
      responseBody: true,
      requestBody: true,
      logPrint: (object) {
        debugPrint("Api -> $object");
      },
    ));
  }

  Future<AuthResponse?> login(String email, String password) async {
    var response = await _dio.post(ApiConstants.signInApi,
        data: {"email": email, "password": password});
    var authResponse = AuthResponse.fromJson(response.data);
    return authResponse;
  }
  Future<AuthResponse?> signup(SignupRequiestBody requestBody) async {
    var response =
        await _dio.post(ApiConstants.signupApi, data: requestBody.toJson());
    var authResponse = AuthResponse.fromJson(response.data);
    return authResponse;
  }

  Future<String?> forgetPassword(String email) async {
    var response =
        await _dio.post(ApiConstants.forgetPasswordApi, data: {"email": email});
    return response.data['info'];
  }

  Future<void> verificationCode(String resetCode) async {
    var response = await _dio
        .post(ApiConstants.resetCodeApi, data: {"resetCode": resetCode});
    return response.data['message'];
  }

  Future<void> resetPassword(String email, String password) async {
    var response = await _dio.put(ApiConstants.resetPasswordApi,
        data: {"email": email, "newPassword": password});
    return response.data['message'];
  }
}
