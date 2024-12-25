import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/core/widgets/app_button.dart';
import 'package:online_exam/core/widgets/app_outline_button.dart';
import 'package:online_exam/presentation/questions/questions_view.dart';
import 'package:online_exam/presentation/score/widgets/result_counter_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as ExamScoreData;
    double percentage = (data.correctAnswerslength / data.questionLength) * 100;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.examScore),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.yourScore,
              style: TextStyles.font18Black500Weight,
            ),
            verticalSpace(24),
            Row(
              children: [
                ///------- > Circular Percent Indicator <-------
                CircularPercentIndicator(
                  radius: 66.0,
                  lineWidth: 7.0.w,
                  animation: true,
                  percent: (data.correctAnswerslength / data.questionLength),
                  center: Text(
                    "${percentage.toStringAsFixed(2)}%",
                    style: TextStyles.font20Black500Weight.copyWith(
                      color: AppColors.black.withOpacity(.50),
                    ),
                  ),
                  progressColor: AppColors.primary,
                  // progressBorderColor: Colors.red,
                  backgroundColor: AppColors.error,
                ),
                horizontalSpace(20),
                Expanded(
                  ///-------> Result Counters <--------
                  child: Column(
                    children: [
                      ResultCounterWidget(
                        color: AppColors.primary,
                        resultCounter: data.correctAnswerslength,
                        text: AppStrings.correct,
                      ),
                      verticalSpace(8),
                      ResultCounterWidget(
                        color: AppColors.error,
                        resultCounter:
                            data.questionLength - data.correctAnswerslength,
                        text: AppStrings.incorrect,
                      ),
                    ],
                  ),
                )
              ],
            ),
            //---------> show result & start Buttons  <--------
            const Spacer(flex: 1),
            AppButton(
                isExpanded: true,
                text: AppStrings.showResult,
                onPressed: () {}),
            verticalSpace(24),
            AppOutlineButton(
              text: AppStrings.startAgain,
              onPressed: () {},
              isExpanded: true,
              color: AppColors.primary,
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
