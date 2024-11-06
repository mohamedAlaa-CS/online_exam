import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/domin/entities/exam.dart';

class ExamCard extends StatelessWidget {
  final String? subjectName;
  final Exam exam;

  const ExamCard({Key? key, required this.exam, this.subjectName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushName(
          Routers.startExamView,
          arguments: {
            'exam': exam,
            'subjectName': subjectName,
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(42, 41, 41, .25),
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/image/exam.png',
              width: 60.w,
              height: 71.h,
              fit: BoxFit.cover,
            ),
            horizontalSpace(16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exam.title ?? "Unknown Exam",
                    style: TextStyles.font16BlackBase500Weight,
                  ),
                  Text(
                    "${exam.numberOfQuestions} Questions",
                    style: TextStyles.font13grey400Weight,
                  ),
                  verticalSpace(16.h),
                  Row(
                    children: [
                      Text(
                        "From: ",
                        style: TextStyles.font13blackBase400Weight,
                      ),
                      Text(
                        "1.00",
                        style: TextStyles.font13blackBase500Weight,
                      ),
                      horizontalSpace(8.w),
                      Text(
                        "To: ",
                        style: TextStyles.font13blackBase400Weight,
                      ),
                      Text(
                        "6.00",
                        style: TextStyles.font13blackBase500Weight,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "${exam.duration} Minutes",
              style: TextStyles.font13blueBase400Weight,
            ),
          ],
        ),
      ),
    );
  }
}
