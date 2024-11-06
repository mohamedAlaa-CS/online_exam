import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/view/questionanswer_viewModel.dart';

class QuestionSlider extends StatelessWidget {
  const QuestionSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = BlocProvider.of<QuestionsViewModel>(context);
    int currentQuestion = viewModel.currentIndex + 1;
    int totalQuestions = viewModel.questions?.length ?? 1;

    return Column(
      children: [
        Text(
          'Question $currentQuestion of $totalQuestions',
          style: TextStyles.font14grey500Weight,
        ),
        verticalSpace(8),
        LinearProgressIndicator(
          value: currentQuestion / totalQuestions,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
        ),
      ],
    );
  }
}
