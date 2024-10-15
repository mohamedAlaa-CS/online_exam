import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/use_case/auth_use_case/reset_code_use_case.dart';
import 'package:online_exam/presentation/forget_password/manager/rest_code_view_model/reset_code_states.dart';

@injectable
class ResetCodeViewModel extends Cubit<ResetCodeStates> {
  ResetCodeUseCase resetCodeUseCase;

  ResetCodeViewModel(this.resetCodeUseCase) : super(ResetCodeInitial());

  void resetCode(String resetCode) async {
    emit(ResetCodeLoadingState());
    var result = await resetCodeUseCase.resetCode(resetCode);
    switch (result) {
      case Success<void>():
        {
          emit(ResetCodeSuccessState());
        }
      case Fail<void>():
        {
          emit(ResetCodeErrorState(result.exception));
        }
    }
  }
}
