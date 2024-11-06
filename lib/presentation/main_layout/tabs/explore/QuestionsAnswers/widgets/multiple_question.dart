import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';

class MultipleQuestion extends StatelessWidget {
  const MultipleQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    List<bool> selectedValues = [false, false, false, false];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.w),
      child: Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: selectedValues.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: CheckboxListTile(
                    value: selectedValues[index],
                    onChanged: (bool? value) {
                      selectedValues[index] = value ?? false;
                    },
                    title: Text(
                      "Html is Hyper Markup Language",
                      style: TextStyles.font14blackBase400Weight,
                    ),
                    activeColor: AppColors.primary,
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
