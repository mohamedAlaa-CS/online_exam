import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/core/widgets/app_button.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/widgets/custome_circle_indecator.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/widgets/custome_outline_buttom.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ExamResult extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ExamResult({
    Key? key,
    required this.score,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percentage = totalQuestions > 0 ? (score / totalQuestions) : 0;
    int incorrect = totalQuestions - score;

    return Scaffold(
      appBar: AppBar(title: const Text('Exam Result')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Score",
              style: TextStyles.font18BlackBase500Weight,
            ),
            verticalSpace(40),
            Row(
              children: [
                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 7.0,
                  percent: percentage,
                  center: Text(
                    "${(percentage * 100).toStringAsFixed(0)}%",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  backgroundColor: AppColors.error,
                  progressColor: AppColors.primary,
                ),
                horizontalSpace(40),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Correct   ',
                          style: TextStyles.font16BlueBase500Weight,
                        ),
                        horizontalSpace(40),
                        CustomCircleIndicator(
                          number: score,
                          color: AppColors.blueBase,
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Row(
                      children: [
                        Text(
                          'InCorrect',
                          style: TextStyles.font16BlueBase500Weight,
                        ),
                        horizontalSpace(40),
                        CustomCircleIndicator(
                          number: incorrect,
                          color: AppColors.error,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(50),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: 'Show Results',
                  onPressed: () {},
                ),
              ),
            ),
            verticalSpace(20),
            Align(
                alignment: Alignment.center,
                child: CustomOutlinedButton(
                  text: 'Start again',
                  color: AppColors.blueBase,
                  onPressed: () {},
                  isExpanded: true,
                )),
          ],
        ),
      ),
    );
  }
}
