import 'package:flutter/material.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/core/widgets/app_button.dart';
import 'package:online_exam/domin/entities/exam_entity.dart';
import 'package:online_exam/presentation/exam/widgets/instruction_item_widget.dart';

class StartExamView extends StatelessWidget {
  const StartExamView({super.key});

  @override
  Widget build(BuildContext context) {
    var exam = ModalRoute.of(context)!.settings.arguments as ExamEntity;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///--------> Exam details <--------///
            Row(
              children: [
                Text(
                  exam.title,
                  style: TextStyles.font20Black500Weight,
                ),
                const Spacer(),
                Text(
                  '${exam.duration} ${AppStrings.min}',
                  style: TextStyles.font13Primary400Weight,
                ),
              ],
            ),
            Text(
              '${exam.numberOfQuestions} ${AppStrings.questions}',
              style: TextStyles.font16Gray400Weight,
            ),
            verticalSpace(16),
            const Divider(),
            verticalSpace(16),
            Text(
              AppStrings.instructions,
              style: TextStyles.font18Black500Weight,
            ),

            ///--------> Instructions List <--------///
            verticalSpace(16),
            const InstructionItem(instructionTitle: AppStrings.instructions1),
            const InstructionItem(instructionTitle: AppStrings.instructions2),
            const InstructionItem(instructionTitle: AppStrings.instructions3),
            verticalSpace(40),
            //--------> Start Button <--------///
            AppButton(
              isExpanded: true,
              onPressed: () {
                ///--------> Navigate to Questions View <--------///
                context.pushName(Routers.questionsView);
              },
              text: AppStrings.start,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
