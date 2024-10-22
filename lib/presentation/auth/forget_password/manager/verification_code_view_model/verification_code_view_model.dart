import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/cache/shared_preferences.dart';
import 'package:online_exam/core/helper/constant.dart';
import 'package:online_exam/data/api/model/request/verifiay_reset_code_request.dart';
import 'package:online_exam/data/api/model/response/forget_password_response.dart';
import 'package:online_exam/data/api/model/response/verifiay_reset_code_response.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/use_case/auth_use_case/forget_password_use_case.dart';
import 'package:online_exam/domin/use_case/auth_use_case/verification_code_use_case.dart';
import 'package:online_exam/presentation/auth/forget_password/manager/verification_code_view_model/verification_code_action.dart';
import 'package:online_exam/presentation/auth/forget_password/manager/verification_code_view_model/verification_code_states.dart';

@injectable
class VerificationCodeViewModel extends Cubit<VerificationCodeStates> {
  VerificationCodeUseCase verificationCodeUseCase;
  ForgetPasswordUseCase forgetPasswordUseCase;

  VerificationCodeViewModel(
    this.verificationCodeUseCase,
    this.forgetPasswordUseCase,
  ) : super(VerificationCodeInitial());
  static VerificationCodeViewModel get(context) => BlocProvider.of(context);
  TextEditingController pinPutController = TextEditingController();
  GlobalKey<FormState> pinPutformKey = GlobalKey<FormState>();

  void doAction(VerificationCodeAction action) {
    switch (action) {
      case VerifyCodeAction():
        _verifiyCode(action.verifiayResetCodeRequest);
        break;
      case ResendOtpAction():
        _resendOtp();
    }
  }

  Future<void> _verifiyCode(
    VerifiayResetCodeRequest verifiayResetCodeRequest,
  ) async {
    if (!pinPutformKey.currentState!.validate()) return;
    emit(VerificationCodeLoadingState());
    var result = await verificationCodeUseCase
        .verifiyResetCode(verifiayResetCodeRequest);
    switch (result) {
      case Success<VerifiayResetCodeResponse>():
        {
          emit(VerificationCodeSuccessState());
          break;
        }
      case Fail<VerifiayResetCodeResponse>():
        {
          emit(VerificationCodeErrorState(result.exception));
          break;
        }
    }
  }

  void _resendOtp() async {
    emit(ResetOtpLoadingState());
    var result = await forgetPasswordUseCase
        .forgetPassword(SharedPreferencesHelper.getString(
      key: Constant.forgetPasswordUserEmailKey,
    ));
    switch (result) {
      case Success<ForgetPasswordResponse>():
        {
          emit(ResetOtpSuccessState(result.data));
          break;
        }
      case Fail<ForgetPasswordResponse>():
        {
          emit(ResetOtpErrorState(result.exception));
          break;
        }
    }
  }
}
