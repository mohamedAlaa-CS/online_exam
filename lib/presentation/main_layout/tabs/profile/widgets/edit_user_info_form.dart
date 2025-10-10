import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/dialogs/app_dialogs.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/user.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/manager/edit_profile_view_model/edit_profile_states.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/manager/edit_profile_view_model/edit_profile_view_model.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/widgets/user_info_form.dart';

class EditUserInfoForm extends StatelessWidget {
  const EditUserInfoForm(
      {super.key, required this.user, required this.viewModel});

  final UserInfoEntity user;
  final EditProfileViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileViewModel, EditProfileStates>(
      listenWhen: (previous, current) =>
          current is EditProfileLoading ||
          current is EditProfileError ||
          current is EditProfileSuccess,
      listener: (context, state) {
        if (state is EditProfileError) {
          context.pop();
          var errorMessage = handellerErrorMessage(state.exception);
          AppDialogs.showErrorDialog(context, errorMessage);
        }
        if (state is EditProfileSuccess) {
          AppDialogs.showSuccessDialog(context,
              titile: 'Success',
              description: 'Your profile has been updated successfully',
              buttonText: 'Continue', onButtonClicked: () {
            context.pop();
          });
        }
      },
      builder: (context, state) {
        log(state.toString());

        if (state is EditProfileInitial) {
          viewModel.userNameController.text = user.username ?? '';
          viewModel.firstNameController.text = user.firstName ?? '';
          viewModel.lastNameController.text = user.lastName ?? '';
          viewModel.emailController.text = user.email ?? '';
          viewModel.phoneController.text = user.phone ?? '';
        }

        return UserInfoForm(
          formKey: viewModel.editProfileFormKey,
          userNameController: viewModel.userNameController,
          firstNameController: viewModel.firstNameController,
          lastNameController: viewModel.lastNameController,
          emailController: viewModel.emailController,
          phoneController: viewModel.phoneController,
          passwordController: viewModel.passwordController,
          buttonColor: AppColors.primary,
          isButtonLoading: state is EditProfileLoading,
          onbuttonClicked: () {
            viewModel.convertTokenAndEditUserInfo();
          },
        );
      },
    );
  }
}
