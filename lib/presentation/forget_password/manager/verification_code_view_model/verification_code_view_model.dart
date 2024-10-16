import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/use_case/auth_use_case/verification_code_use_case.dart';
import 'package:online_exam/presentation/forget_password/manager/verification_code_view_model/verification_code_states.dart';

@injectable
class VerificationCodeViewModel extends Cubit<VerificationCodeStates> {
  VerificationCodeUseCase resetCodeUseCase;
  VerificationCodeViewModel(this.resetCodeUseCase)
      : super(VerificationCodeInitial());
  static VerificationCodeViewModel get(context) => BlocProvider.of(context);
  TextEditingController pinPutController = TextEditingController();
  Future<void> resetCode(String resetCode) async {
    emit(VerificationCodeLoadingState());
    var result = await resetCodeUseCase.resetCode(resetCode);
    switch (result) {
      case Success<void>():
        {
          emit(VerificationCodeSuccessState());
        }
      case Fail<void>():
        {
          emit(VerificationCodeErrorState(result.exception));
        }
    }
  }
}
