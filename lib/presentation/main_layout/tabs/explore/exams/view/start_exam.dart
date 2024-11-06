// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/core/widgets/app_buttom.dart';
import 'package:online_exam/domin/entities/exam.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/exams/widgets/instructions.dart';

class StartExam extends StatelessWidget {
  final Exam exam;
  final String subjectName;

  const StartExam({
    Key? key,
    required this.exam,
    required this.subjectName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/image/exam.png',
                      width: 42.w,
                      height: 47.h,
                      fit: BoxFit.cover,
                    ),
                    horizontalSpace(8.h),
                    Text(
                      subjectName,
                      style: TextStyles.font20BlackBase500Weight,
                    ),
                  ],
                ),
                Text(
                  "${exam.duration} Minutes",
                  style: TextStyles.font13blueBase400Weight,
                ),
              ],
            ),
            verticalSpace(8.h),
            Row(
              children: [
                Text(
                  exam.title!,
                  style: TextStyles.font18BlackBase500Weight,
                ),
                horizontalSpace(8.h),
                Container(
                  width: 1.w,
                  height: 16.h,
                  color: AppColors.Blue30,
                ),
                horizontalSpace(8.h),
                Text(
                  "${exam.numberOfQuestions} Question",
                  style: TextStyles.font16Gray400Weight,
                ),
              ],
            ),
            verticalSpace(8.h),
            Divider(
              color: AppColors.blue10,
              thickness: 0.5.h,
              height: 0.5.h,
            ),
            verticalSpace(16.h),
            const InstructionsWidget(
              instructions: [
                "Lorem ipsum dolor sit amet consectetur.",
                "Lorem ipsum dolor sit amet consectetur.",
                "Lorem ipsum dolor sit amet consectetur.",
                "Lorem ipsum dolor sit amet consectetur.",
              ],
            ),
            verticalSpace(32.h),
            SizedBox(
                width: double.infinity,
                child: AppButton(
                    text: "Start",
                    onPressed: () {
                      context.pushName(
                        Routers.questionsAnswers,
                        arguments: {
                          'exam': exam,
                        },
                      );
                    }))
          ],
        ),
      )),
    );
  }
}
