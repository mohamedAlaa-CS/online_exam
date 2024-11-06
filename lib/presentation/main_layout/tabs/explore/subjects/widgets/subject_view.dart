import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/exams/view/exam.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/subjects/view/subject_state.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/subjects/view/subject_viewModel.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.w),
          child: Text(
            'Browse by subject',
            style: TextStyles.font18Black500Weight,
          ),
        ),
        Expanded(
          child: BlocBuilder<SubjectsViewModel, SubjectsViewState>(
            builder: (context, state) {
              if (state is SubjectsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SubjectsSuccessState) {
                return ListView.builder(
                  itemCount: state.subjects?.length ?? 0,
                  itemBuilder: (context, index) {
                    final subject = state.subjects![index];
                    return GestureDetector(
                      onTap: () {
                        context.pushName(
                          Routers.examsView,
                          arguments: {
                            'subjectId': subject.id,
                            'subjectName': subject.name,
                          },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(42, 41, 41, .25),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 24.w),
                          leading: Image.network(
                            subject.icon ?? '',
                            width: 48.w,
                            height: 48.h,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.broken_image, size: 48.w);
                            },
                          ),
                          title: Text(
                            subject.name ?? 'Unknown Subject',
                            style: TextStyles.font16Black400Weight,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is SubjectsErrorState) {
                return Center(child: Text("Error: ${state.exception}"));
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }
}
