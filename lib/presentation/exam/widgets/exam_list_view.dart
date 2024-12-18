import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam/domin/entities/exam_entity.dart';
import 'package:online_exam/presentation/exam/view_model/exam_states.dart';
import 'package:online_exam/presentation/exam/view_model/exam_view_model.dart';
import 'package:online_exam/presentation/exam/widgets/exam_item_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExamListView extends StatelessWidget {
  const ExamListView({super.key, required this.staticImage});
  final String staticImage;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamViewModel, ExamStates>(
      listener: (context, state) {},
      buildWhen: (previous, current) =>
          current is ExamLoadingState ||
          current is ExamErrorState ||
          current is ExamSuccessState ||
          current is ExamEmptyState,
      builder: (context, state) {
        List<ExamEntity> exams = [];
        if (state is ExamEmptyState) {
          return Expanded(
              child: LottieBuilder.asset('assets/lottie/not_found_data.json'));
        }
        if (state is ExamSuccessState) {
          exams = state.exams;
        }

        if (state is ExamErrorState) {
          return Center(child: Text(state.message));
        }

        return Expanded(
          child: ListView.builder(
            itemCount: exams.isEmpty ? 4 : exams.length,
            itemBuilder: (context, index) => SlideInLeft(
              duration: const Duration(milliseconds: 250),
              delay: Duration(milliseconds: index * 50),
              animate: true,
              child: Skeletonizer(
                enabled: exams.isEmpty,
                child: ExamItemWidget(
                  image: staticImage,
                  examEntity: exams.isEmpty
                      ? ExamEntity(
                          id: '123',
                          title: 'hello my project',
                          duration: 25,
                          numberOfQuestions: 10,
                        )
                      : exams[index],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
