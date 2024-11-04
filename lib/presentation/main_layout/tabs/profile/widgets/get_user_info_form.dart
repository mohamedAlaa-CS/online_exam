import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/dialogs/app_dialogs.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/manager/get_user_info_view_model/get_user_info_states.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/manager/get_user_info_view_model/get_user_info_view_model.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/widgets/user_info_form.dart';

class GetUserInfoForm extends StatelessWidget {
  const GetUserInfoForm({super.key, required this.viewModel});
  final GetUserInfoViewMOdel viewModel;
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
        if (state is GetUserInfoSuccess) {
          var userData = state.getUserInfoEntity?.user;
          return UserInfoForm(
            userInitialValue: userData?.username,
            firstNameInitialValue: userData?.firstName,
            lastNameInitialValue: userData?.lastName,
            emailInitialValue: userData?.email,
            phoneInitialValue: userData?.phone,
            passwordInitialValue: '123456',
            isAllReadOnly: true,
            onbuttonClicked: () {
              //todo: nav to edit profile
              context.pushName(
                Routers.editProfile,
                arguments: userData,
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
