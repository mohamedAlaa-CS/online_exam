import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/styles.dart';

class InstructionsWidget extends StatelessWidget {
  final List<String> instructions;

  const InstructionsWidget({Key? key, required this.instructions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Instructions", style: TextStyles.font18BlackBase500Weight),
        verticalSpace(8.h),
        Column(
          children: instructions.map((instruction) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                horizontalSpace(8),
                const Icon(
                  Icons.circle,
                  size: 6,
                  color: Colors.grey,
                ),
                horizontalSpace(8),
                Text(
                  instruction,
                  style: TextStyles.font14grey500Weight,
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
