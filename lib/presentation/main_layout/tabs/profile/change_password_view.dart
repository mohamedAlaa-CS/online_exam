import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/dialogs/app_dialogs.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/helper/validations.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/widgets/app_button.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';
import 'package:online_exam/core/widgets/title_of_view.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/manager/change_password_view_model/change_password_states.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/manager/change_password_view_model/change_password_view_model.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});
  final ChangePasswordViewModel viewModel = getIt<ChangePasswordViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: SingleChildScrollView(
            child: BlocProvider<ChangePasswordViewModel>(
              create: (context) => viewModel,
              child:
                  BlocConsumer<ChangePasswordViewModel, ChangePasswordStates>(
                listener: (context, state) {
                  if (state is ChangePasswordError) {
                    var errorMessage = handellerErrorMessage(state.exception);
                    AppDialogs.showErrorDialog(context, errorMessage);
                  }
                  if (state is ChangePasswordSuccess) {
                    AppDialogs.showSuccessDialog(context,
                        titile: AppStrings.success,
                        description:
                            'Your password has been updated successfully',
                        buttonText: AppStrings.continuetext,
                        onButtonClicked: () {
                      context.pop();
                    });
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: viewModel.changePasswordFormKey,
                    child: Column(
                      children: [
                        const TitleOfView(title: AppStrings.resetPassword),
                        AppTextFormField(
                          validator: Validations.validatePassword,
                          controller: viewModel.oldPasswordController,
                          labelText: AppStrings.currentPassword,
                          hintText: AppStrings.currentPassword,
                        ),
                        AppTextFormField(
                          validator: Validations.validatePassword,
                          controller: viewModel.newPasswordController,
                          labelText: AppStrings.newPassword,
                          hintText: AppStrings.newPassword,
                        ),
                        AppTextFormField(
                          validator: Validations.validatePassword,
                          controller: viewModel.confirmPasswordController,
                          labelText: AppStrings.confirmPassword,
                          hintText: AppStrings.confirmPassword,
                        ),
                        verticalSpace(54),
                        if (state is ChangePasswordLoading) ...{
                          const CircularProgressIndicator(
                            color: AppColors.primary,
                          )
                        } else ...{
                          AppButton(
                            isExpanded: true,
                            text: AppStrings.update,
                            color: state is ChangePasswordSuccess
                                ? AppColors.primary
                                : AppColors.grey10,
                            onPressed: () {
                              viewModel.getTokenThenChangePassword();
                            },
                          )
                        }
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
