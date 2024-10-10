import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/presentation/signup/sign_up_viewmodel.dart';
import 'package:online_exam/presentation/signup/signup_states.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpViewModel signupViewModel = getIt.get<SignUpViewModel>();
    return Scaffold(
      body: Center(
        child: BlocProvider<SignUpViewModel>(
          create: (context) => signupViewModel,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocListener<SignUpViewModel, SignupViewState>(
                listenWhen: (previous, current) =>
                    current is SignupLoadingState ||
                    current is SignupErrorState ||
                    current is SignupSuccessState,
                listener: (context, state) {
                  if (state is SignupLoadingState) {
                    const CircularProgressIndicator();
                  } else if (state is SignupErrorState) {
                    showErrorDialog(context, state.exception.toString());
                  } else if (state is SignupSuccessState) {
                    showSuccessDialog(context);
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    signupViewModel.signup(SignupIntent(
                      username: 'alaaAbdo',
                      firstName: 'abdo',
                      lastName: 'abdo',
                      email: 'alaaaalaa@gmail.com',
                      password: 'Ee3000##',
                      rePassword: 'Ee3000##',
                      phone: '01026489269',
                    ));
                  },
                  child: const Text('signup'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Signup Successful'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Congratulations, you have signed up successfully!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              disabledForegroundColor: Colors.grey,
            ),
            onPressed: () {},
            child: const Text('Continue'),
          ),
        ],
      );
    },
  );
}

void showErrorDialog(BuildContext context, String error) {
  //context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text(
            'Got it',
          ),
        ),
      ],
    ),
  );
}
