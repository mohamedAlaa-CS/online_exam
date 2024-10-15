import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/user.dart';
import 'package:online_exam/domin/use_case/auth_use_case/sign_up_use_case.dart';
import 'package:online_exam/presentation/signup/signup_states.dart';

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
      nameController.text.trim(),
      firstNameController.text.trim(),
      lastNameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
      confirmPasswordController.text.trim(),
      phoneController.text.trim(),
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
