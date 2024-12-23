import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/domin/entities/question/questions_entity/answer.dart';
import 'package:online_exam/presentation/questions/view_model/question_view_model.dart';
import 'package:online_exam/presentation/questions/view_model/questions_states.dart';

class AnswerCheckBoxItemWidget extends StatelessWidget {
  const AnswerCheckBoxItemWidget({super.key, required this.answer});
  final AnswerEntity answer;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionViewModel, QuestionsStates>(
      builder: (context, state) {
        var viewModel = context.read<QuestionViewModel>();
        return Container(
          margin: EdgeInsets.only(top: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.lightBlue,
          ),
          child: CheckboxListTile(
            activeColor: AppColors.primary,
            title: Text(answer.answer ?? ''),
            value: viewModel.selectedAnswer?[viewModel.currentQuestion]
                .contains(answer.key ?? ''),
            onChanged: (value) {
              //  viewModel.doAction(AnswerQuestionAction(answer.key ?? ''));
            },
          ),
        );
      },
    );
  }
}
