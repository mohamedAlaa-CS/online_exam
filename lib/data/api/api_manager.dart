import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/cache/shared_preferences.dart';
import 'package:online_exam/core/helper/constant.dart';
import 'package:online_exam/data/api/model/request/change_password_request.dart';
import 'package:online_exam/data/api/model/request/edit_profile_request.dart';
import 'package:online_exam/data/api/model/request/forget_password_request.dart';
import 'package:online_exam/data/api/model/request/reset_password_request.dart';
import 'package:online_exam/data/api/model/request/signup_request_body.dart';
import 'package:online_exam/data/api/model/request/verifiay_reset_code_request.dart';
import 'package:online_exam/data/api/model/response/auth_response/auth_response.dart';
import 'package:online_exam/data/api/model/response/change_password_response.dart';
import 'package:online_exam/data/api/model/response/explor/subject/subject_dto/subject_dto.dart';
import 'package:online_exam/data/api/model/response/forget_password_response.dart';
import 'package:online_exam/data/api/model/response/get_user_info_response/get_user_info_response.dart';
import 'package:online_exam/data/api/model/response/reset_password_response.dart';
import 'package:online_exam/data/api/model/response/verifiay_reset_code_response.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/change_password_entity.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/get_user_info_entity.dart';

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

  Future<ForgetPasswordResponse> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest) async {
    var response = await _dio.post(ApiConstants.forgetPasswordApi,
        data: {"email": forgetPasswordRequest.email});

    return ForgetPasswordResponse.fromJson(response.data);
  }

  Future<VerifiayResetCodeResponse> verificationCode(
      VerifiayResetCodeRequest verifiayResetCodeRequest) async {
    var response = await _dio.post(ApiConstants.resetCodeApi,
        data: {"resetCode": verifiayResetCodeRequest.resetCode});
    return VerifiayResetCodeResponse.fromJson(response.data);
  }

  Future<ResetPasswordResponse> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    var response = await _dio.put(ApiConstants.resetPasswordApi, data: {
      "email": resetPasswordRequest.email,
      "newPassword": resetPasswordRequest.newPassword
    });
    return ResetPasswordResponse.fromJson(response.data);
  }

  Future<GetUserInfoEntity?> getUserInfo(String token) async {
    var response = await _dio.get(
      ApiConstants.getUserInfoApi,
      options: Options(
        headers: {"token": token},
      ),
    );
    var getUserInfoResponse = GetUserInfoResponse.fromJson(response.data);
    return getUserInfoResponse.toEtity();
  }

  Future<GetUserInfoEntity?> editUserInfo(
      EditProfileRequest editProfileRequest, String token) async {
    var response = await _dio.put(
      ApiConstants.editUserInfoApi,
      data: editProfileRequest.toJson(),
      options: Options(
        headers: {"token": token},
      ),
    );
    var editUserInfoResponse = GetUserInfoResponse.fromJson(response.data);
    return editUserInfoResponse.toEtity();
  }

  Future<ChangePasswordEntity?> changePassword(
      ChangePasswordRequest changePasswordRequest, String token) async {
    var response = await _dio.patch(
      ApiConstants.changePasswordApi,
      data: changePasswordRequest.toJson(),
      options: Options(
        headers: {"token": token},
      ),
    );
    var changePasswordResponse = ChangePasswordResponse.fromJson(response.data);
    return changePasswordResponse.toEtity();
  }

  Future<SubjectDto> getAllSubject() async {
    var token =
        await SharedPreferencesHelper.getSecuredString(key: Constant.keyToken);
    var response = await _dio.get(
      ApiConstants.getAllSubjectApi,
      options: Options(
        headers: {"token": token},
      ),
    );

    return SubjectDto.fromJson(response.data);
  }
}
