import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/exams/view/exams_viewModel.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/exams/widgets/exam_card.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/exams/view/exams_state.dart';

class ExamsView extends StatelessWidget {
  final String? subjectId;
  final String? subjectName;

  ExamsView({Key? key, this.subjectId, this.subjectName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          subjectName ?? 'Unknown Subject',
          style: TextStyles.font20BlackBase500Weight,
        ),
        titleSpacing: 16.w,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<ExamsViewModel, ExamsViewState>(
            builder: (context, state) {
              if (state is ExamsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ExamsSuccessState) {
                return ListView.builder(
                  itemCount: state.exams!.length,
                  itemBuilder: (context, index) {
                    return ExamCard(
                      exam: state.exams![index],
                      subjectName: subjectName,
                    );
                  },
                );
              } else if (state is ExamsErrorState) {
                return Center(child: Text('Error: ${state.exception}'));
              } else if (state is ExamsEmptyState) {
                return const Center(child: Text('No exams available'));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
