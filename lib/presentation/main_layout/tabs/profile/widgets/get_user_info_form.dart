import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/dialogs/app_dialogs.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/manager/get_user_info_view_model/get_user_info_states.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/manager/get_user_info_view_model/get_user_info_view_model.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/widgets/user_info_form.dart';

class GetUserInfoForm extends StatelessWidget {
  const GetUserInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserInfoViewMOdel, GetUserInfoStates>(
      listener: (context, state) {
        if (state is GetUserInfoLoading) {
          AppDialogs.showLoadingDialog(context);
        }
        if (state is GetUserInfoError) {
          context.pop();
          var errorMessage = handellerErrorMessage(state.exception);
          AppDialogs.showErrorDialog(context, errorMessage);
        }
        if (state is GetUserInfoSuccess) {
          context.pop();
        }
      },
      builder: (context, state) {
        GetUserInfoViewMOdel viewModel = getIt<GetUserInfoViewMOdel>();

        if (state is GetUserInfoSuccess) {
          return UserInfoForm(
            userNameController: viewModel.userNameController,
            firstNameController: viewModel.firstNameController,
            lastNameController: viewModel.lastNameController,
            emailController: viewModel.emailController,
            phoneController: viewModel.phoneController,
            passwordController: viewModel.passwordController,
            isAllReadOnly: true,
            onbuttonClicked: () {
              //todo: nav to edit profile
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
