import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/model/user.dart';
import 'package:online_exam/domin/usecase/sign_up_usecase.dart';
import 'package:online_exam/presentation/signup/signup_states.dart';

@injectable
class SignUpViewModel extends Cubit<SignupViewState> {
  SignupUseCase signupUsecase;
  SignUpViewModel(this.signupUsecase) : super(InitialState());

  void signup(
    SignupIntent intent,
  ) async {
    emit(SignupLoadingState());
    var result = await signupUsecase.invoke(
      intent.username,
      intent.firstName,
      intent.lastName,
      intent.email,
      intent.password,
      intent.rePassword,
      intent.phone,
    );
    switch (result) {
      case Success<User?>():
        {
          emit(SignupSuccessState(result.data));
        }
      case Fail<User?>():
        {
          emit(SignupErrorState(result.exception));
        }
    }
  }
}

sealed class SignUpViewIntent {}

class SignupIntent extends SignUpViewIntent {
  String username;
  String firstName;
  String lastName;
  String email;
  String password;
  String rePassword;
  String phone;
  SignupIntent({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });
}
