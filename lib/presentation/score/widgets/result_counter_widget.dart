import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/theming/styles.dart';

class ResultCounterWidget extends StatelessWidget {
  const ResultCounterWidget({
    super.key,
    required this.color,
    required this.resultCounter,
    required this.text,
  });
  final Color color;
  final int resultCounter;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyles.font16White500Weight.copyWith(color: color),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(4),
          height: 25.h,
          width: 25.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: 1.5,
            ),
          ),
          child: Text(
            textAlign: TextAlign.center,
            resultCounter.toString(),
            style: TextStyles.font13Primary400Weight.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}
