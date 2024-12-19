import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/domin/entities/exam_entity.dart';

class ExamItemWidget extends StatelessWidget {
  const ExamItemWidget({
    super.key,
    required this.examEntity,
    required this.image,
  });
  final ExamEntity examEntity;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1.5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                image,
                height: 60.h,
                //width: 50.w,
                fit: BoxFit.cover,
                errorBuilder: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
            horizontalSpace(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        examEntity.title,
                        style: TextStyles.font16Black400Weight,
                      ),
                      Text(
                        '${examEntity.duration} ${AppStrings.min}',
                        style: TextStyles.font13Primary400Weight,
                      ),
                    ],
                  ),
                  verticalSpace(5),
                  Text(
                    '${examEntity.numberOfQuestions} ${AppStrings.questions}',
                    style: TextStyles.font13Primary400Weight
                        .copyWith(color: AppColors.grey),
                  ),
                  Text(
                    AppStrings.staticTime,
                    style: TextStyles.font14PlaceHolder400Weight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
