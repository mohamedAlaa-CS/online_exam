import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/cache/shared_preferences.dart';
import 'package:online_exam/core/helper/constant.dart';
import 'package:online_exam/data/api/model/response/auth_response/auth_response.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/use_case/auth_use_case/login_use_case.dart';
import 'package:online_exam/presentation/auth/login/login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginViewState> {
  final LoginUseCase loginUseCase;

  LoginViewModel(this.loginUseCase) : super(LoginInitialState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  bool rememberMe = false;

  void toggleRememberMe() {
    rememberMe = !rememberMe;
    emit(ToggleRemmemberMeLogin());
  }

  void login() async {
    emit(LoginLoadingState());

    var result = await loginUseCase.invoke(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    switch (result) {
      case Success<AuthResponse?>():
        {
          if (rememberMe == true) {
            SharedPreferencesHelper.setSecuredString(
              key: Constant.keyToken,
              value: result.data?.token ?? '',
            );
          }
          emit(LoginSuccessState(result.data));
        }

      case Fail<AuthResponse?>():
        emit(LoginErrorState(result.exception));
    }
  }
}