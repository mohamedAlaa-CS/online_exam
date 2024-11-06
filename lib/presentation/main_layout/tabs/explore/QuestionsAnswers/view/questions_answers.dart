import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/domin/entities/exam.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/view/questionanswer_state.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/view/questionanswer_viewModel.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/widgets/answers.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/widgets/app_bar_widget.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/widgets/question_navigation.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/widgets/question_slider.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/widgets/time_finished.dart';

class QuestionsAnswers extends StatelessWidget {
  final Exam exam;
  const QuestionsAnswers({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocListener<QuestionsViewModel, QuestionAnswerState>(
            listener: (context, state) {
              if (state is QuestionAnswerTimeUpState) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const TimeFinished(),
                );
              }
            },
            child: BlocBuilder<QuestionsViewModel, QuestionAnswerState>(
              buildWhen: (previous, current) =>
                  current is! QuestionAnswerTimeUpdatedState &&
                  current is! QuestionAnswerTimeUpState,
              builder: (context, state) {
                if (state is QuestionAnswerLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is QuestionAnswerSuccessState) {
                  return Column(
                    children: [
                      QuestionSlider(),
                      Answers(),
                      CustomNavigationButtons(
                        onBackPressed: () {
                          BlocProvider.of<QuestionsViewModel>(context)
                              .goToPreviousQuestion();
                        },
                        onNextPressed: () {
                          BlocProvider.of<QuestionsViewModel>(context)
                              .goToNextQuestion();
                        },
                      ),
                    ],
                  );
                } else if (state is QuestionAnswerErrorState) {
                  return Center(child: Text('Error: ${state.exception}'));
                } else if (state is QuestionAnswerEmptyState) {
                  return const Center(child: Text('No questions available'));
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
