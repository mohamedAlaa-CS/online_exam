import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/subjects/view/subject_viewModel.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SubjectsViewModel>();

    return Padding(
      padding: EdgeInsets.only(top: 1.h, bottom: 8.h),
      child: TextFormField(
        controller: viewModel.searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyles.font14PlaceHolder400Weight,
          prefixIcon: Icon(
            Icons.search,
            size: 24.sp,
            color: AppColors.grey,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(
              color: AppColors.grey,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
