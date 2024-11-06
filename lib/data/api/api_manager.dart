import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/cache/shared_preferences.dart';
import 'package:online_exam/core/helper/constant.dart';
import 'package:online_exam/data/api/model/request/forget_password_request.dart';
import 'package:online_exam/data/api/model/request/reset_password_request.dart';
import 'package:online_exam/data/api/model/request/signup_request_body.dart';
import 'package:online_exam/data/api/model/request/verifiay_reset_code_request.dart';
import 'package:online_exam/data/api/model/response/auth_response/auth_response.dart';
import 'package:online_exam/data/api/model/response/exam_response/exam_dto.dart';
import 'package:online_exam/data/api/model/response/exam_response/questions_answers_dto.dart';
import 'package:online_exam/data/api/model/response/exam_response/subject_dto.dart';
import 'package:online_exam/data/api/model/response/forget_password_response.dart';
import 'package:online_exam/data/api/model/response/reset_password_response.dart';
import 'package:online_exam/data/api/model/response/verifiay_reset_code_response.dart';

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

  Future<List<SubjectDto>?> getAllSubjects() async {
    String? token = await SharedPreferencesHelper.getSecuredString(
        key: Constant.savedKeyToken);

    var response = await _dio.get(
      ApiConstants.getAllSubjectsApi,
      options: Options(headers: {"token": token}),
    );
    return (response.data['subjects'] as List)
        .map((json) => SubjectDto.fromJson(json))
        .toList();
  }

  Future<List<ExamDto>?> getExamsBySubjectId(String subjectId) async {
    String? token = await SharedPreferencesHelper.getSecuredString(
        key: Constant.savedKeyToken);
    var response = await _dio.get(
      "${ApiConstants.getExamsBySubjectIdApi}",
      options: Options(headers: {"token": token}),
    );

    return (response.data['exams'] as List)
        .map((json) => ExamDto.fromJson(json))
        .where((exam) => exam.subjectId == subjectId)
        .toList();
  }

  Future<List<QuestionsDTO>?> getQuestionsByExamId(String examId) async {
    String? token = await SharedPreferencesHelper.getSecuredString(
        key: Constant.savedKeyToken);

    var response = await _dio.get(
      "${ApiConstants.getQuestionAnswersByExamId}?examId=$examId",
      options: Options(headers: {"token": token}),
    );

    return (response.data['questions'] as List)
        .map((json) => QuestionsDTO.fromJson(json))
        .toList();
  }
}
