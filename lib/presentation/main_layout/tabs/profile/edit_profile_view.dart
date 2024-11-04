import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/widgets/title_of_view.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/user.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/manager/edit_profile_view_model/edit_profile_view_model.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/widgets/edit_user_info_form.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/widgets/image_profile_and_edit_icon.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.user});
  final UserInfoEntity user;
  @override
  Widget build(BuildContext context) {
    EditProfileViewModel viewModel = getIt<EditProfileViewModel>();
    return BlocProvider<EditProfileViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TitleOfView(title: AppStrings.profile),
                  verticalSpace(24),
                  ImageProfileAndEditIcon(
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdQLwDqDwd2JfzifvfBTFT8I7iKFFevcedYg&s',
                    deitIconOnTap: () {},
                  ),
                  EditUserInfoForm(user: user, viewModel: viewModel),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
