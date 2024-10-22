import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/model/request/signup_request_body.dart';
import 'package:online_exam/data/api/model/response/auth_response/auth_response.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/use_case/auth_use_case/sign_up_use_case.dart';
import 'package:online_exam/presentation/auth/signup/signup_states.dart';

@injectable
class SignUpViewModel extends Cubit<SignupViewState> {
  SignupUseCase signupUsecase;
  SignUpViewModel(this.signupUsecase) : super(InitialState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void signup() async {
    emit(SignupLoadingState());
    var result = await signupUsecase.invoke(
      SignupRequiestBody(
          email: emailController.text.trim(),
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          password: passwordController.text.trim(),
          rePassword: confirmPasswordController.text.trim(),
          username: nameController.text.trim(),
          phone: phoneController.text.trim()),
    );
    switch (result) {
      case Success<AuthResponse?>():
        {
          emit(SignupSuccessState(result.data));
        }
      case Fail<AuthResponse?>():
        {
          emit(SignupErrorState(result.exception));
        }
    }
  }
}
