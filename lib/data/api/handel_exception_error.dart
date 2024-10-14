import 'package:dio/dio.dart';
import 'package:online_exam/domin/common/custom_exception.dart';

String handellerErrorMessage(Exception? exception) {
  var message = "something went wrong";
  if (exception is NoInternetError) {
    message = "please check internet connection";
  } else if (exception is ServerError) {
    message = exception.serverMessage ?? "E-mail Or Password Not Valid!";
  } else if (exception is DioHttpException) {
    switch (exception.exception!.type) {
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with ApiServer";
      case DioExceptionType.sendTimeout:
        message = 'Send timeout with ApiServer';

      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout with ApiServer';

      case DioExceptionType.badCertificate:
        message = 'badCertificate with api server';

      case DioExceptionType.badResponse:
        String error = serverFailure(exception.exception!.response!.statusCode!,
            exception.exception!.response!.data);

        return error;

      case DioExceptionType.cancel:
        return 'Request to ApiServer was canceld';
      case DioExceptionType.connectionError:
        return 'No Internet Connection';
      case DioExceptionType.unknown:
        return 'Opps There was an Error, Please try again';
    }
    message = exception.exception?.message ?? "something went wrong";
  }
  return message;
}

String serverFailure(int statusCode, dynamic response) {
  if (statusCode == 404) {
    return 'Your request was not found, please try later';
  } else if (statusCode == 500) {
    return 'There is a problem with server, please try later';
  } else if (statusCode == 400 ||
      statusCode == 401 ||
      statusCode == 403 ||
      statusCode == 409) {
    return response['message'];
  } else {
    return 'There was an error , please try again';
  }
}
