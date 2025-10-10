import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/domin/entities/explor_entity/subject_entity.dart';

class SubjectItemWidget extends StatelessWidget {
  const SubjectItemWidget({super.key, required this.subject});

  final SubjectEntity subject;

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
                subject.image,
                height: 55.h,
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
              child: Text(
                subject.name,
                style: TextStyles.font16Black400Weight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
