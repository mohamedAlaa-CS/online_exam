import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/helper/dialog.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/presentation/login/login_states.dart';
import 'package:online_exam/presentation/login/login_viewmodel.dart';
import 'package:online_exam/presentation/login/widgets/form_login.dart';


class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginViewModel viewModel = getIt.get<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Login'),
        titleSpacing: 16.w,
      ),
      body: BlocProvider<LoginViewModel>(
        create: (context) => viewModel,
        child: BlocConsumer<LoginViewModel, LoginViewState>(
          listener: (context, state) {
            switch (state) {
              case LoginLoadingState():
                AppDialogs.showLoadingDialog(context);
                break;
              case LoginErrorState():
                Navigator.of(context).pop();
                String errorMessage = handellerErrorMessage(state.exception);
                AppDialogs.showErrorDialog(context, errorMessage);
                break;
              case LoginSuccessState():
                Navigator.of(context).pop();
                context.pushReplacementNamed(Routers.homeView);

              default:
                break;
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: FormLogin(
                viewModel: viewModel,
              ),
            );
          },

        ),
      ),
    );
  }
}
