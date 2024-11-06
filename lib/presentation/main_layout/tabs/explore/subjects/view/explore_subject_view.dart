import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/subjects/view/subject_viewModel.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/subjects/widgets/search_feild.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/subjects/widgets/subject_view.dart';

class ExploreSubject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Survey',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.primary,
          ),
        ),
        titleSpacing: 16.w,
      ),
      body: BlocProvider(
        create: (context) => getIt<SubjectsViewModel>()..fetchSubjects(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Column(
              children: [
                SearchField(),
                Expanded(
                  child: SubjectCard(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
