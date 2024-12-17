import 'package:flutter/material.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/core/widgets/back_button.dart';

class TitleOfView extends StatelessWidget {
  const TitleOfView({super.key, this.title, this.popWithResult, this.style});
  final String? title;
  final TextStyle? style;
  final bool? popWithResult;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MainBackButton(popWithResult: popWithResult ?? false),
        horizontalSpace(8),
        Text(
          title ?? '',
          style: style ?? TextStyles.font20Black500Weight,
          // style: AppStyles.h1,
        ),
      ],
    );
  }
}
