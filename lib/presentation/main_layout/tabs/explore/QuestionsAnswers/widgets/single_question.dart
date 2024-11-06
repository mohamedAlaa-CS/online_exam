import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/domin/entities/questions_answers.dart';

class SingleQuestion extends StatelessWidget {
  final List<Answer> answers;
  final Function(String) onAnswerSelected;
  final String? selectedAnswer;

  const SingleQuestion({
    super.key,
    required this.answers,
    required this.onAnswerSelected,
    this.selectedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: answers.length,
      itemBuilder: (context, index) {
        bool isSelected = selectedAnswer == answers[index].key;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.w),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200), // مدة الأنيميشن
            decoration: BoxDecoration(
              color: isSelected ? AppColors.blue10 : AppColors.lightBlue,
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: RadioListTile<String>(
              value: answers[index].key,
              groupValue: selectedAnswer,
              onChanged: (String? value) {
                onAnswerSelected(value!);
              },
              title: Text(
                answers[index].answerText,
                style: TextStyles.font14blackBase400Weight,
              ),
              activeColor: AppColors.primary,
            ),
          ),
        );
      },
    );
  }
}
