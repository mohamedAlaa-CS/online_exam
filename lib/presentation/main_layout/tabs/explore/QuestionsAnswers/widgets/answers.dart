import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/view/questionanswer_viewModel.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/widgets/single_question.dart';

class Answers extends StatelessWidget {
  const Answers({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = BlocProvider.of<QuestionsViewModel>(context);
    final question = viewModel.questions?[viewModel.currentIndex];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.w),
            child: Text(
              question!.questionText,
              style: TextStyles.font18BlackBase500Weight,
            ),
          ),
          SingleQuestion(
            answers: question.answers,
            selectedAnswer: viewModel.selectedAnswers[viewModel.currentIndex],
            onAnswerSelected: (String answer) {
              viewModel.answerQuestion(answer);
            },
          ),
        ],
      ),
    );
  }
}
