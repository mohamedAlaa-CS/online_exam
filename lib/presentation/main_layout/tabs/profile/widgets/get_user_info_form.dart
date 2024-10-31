import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/dialogs/app_dialogs.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/core/widgets/app_button.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/manager/get_user_info_view_model/get_user_info_states.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/manager/get_user_info_view_model/get_user_info_view_model.dart';

class GetUserInfoForm extends StatelessWidget {
  const GetUserInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    GetUserInfoViewMOdel viewModel = getIt<GetUserInfoViewMOdel>();
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
      },
      builder: (context, state) {
        if (state is GetUserInfoSuccess) {
          context.pop();
          return Column(
            children: [
              AppTextFormField(
                controller: viewModel.userNameController,
                isReadOnly: true,
                labelText: 'User name',
                hintStyle: TextStyles.font16Black400Weight,
              ),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: viewModel.firstNameController,
                      isReadOnly: true,
                      labelText: 'First name',
                      hintStyle: TextStyles.font16Black400Weight,
                    ),
                  ),
                  horizontalSpace(17),
                  Expanded(
                    child: AppTextFormField(
                      controller: viewModel.lastNameController,
                      isReadOnly: true,
                      labelText: 'Last name',
                      hintStyle: TextStyles.font16Black400Weight,
                    ),
                  ),
                ],
              ),
              AppTextFormField(
                controller: viewModel.emailController,
                isReadOnly: true,
                labelText: 'Email',
                hintStyle: TextStyles.font16Black400Weight,
              ),
              AppTextFormField(
                controller: viewModel.passwordController,
                isObscureText: true,
                isReadOnly: true,
                hintStyle: TextStyles.font16Black400Weight,
                labelText: 'Password',
                suffixWidget: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Change',
                    style: TextStyles.font12Primary600Weight,
                  ),
                ),
              ),
              AppTextFormField(
                controller: viewModel.phoneController,
                isReadOnly: true,
                labelText: 'Phone Number',
                hintStyle: TextStyles.font16Black400Weight,
              ),
              verticalSpace(40),
              AppButton(
                isExpanded: true,
                color: AppColors.grey10,
                onPressed: () {
                  //todo : nav to update view
                },
                text: AppStrings.update,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
