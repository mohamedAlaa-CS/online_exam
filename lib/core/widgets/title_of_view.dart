import 'package:flutter/material.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/core/widgets/back_button.dart';

class TitleOfView extends StatelessWidget {
  const TitleOfView({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const MainBackButton(),
        horizontalSpace(8),
        Text(
          title ?? '',
          style: TextStyles.font20Black500Weight,
          // style: AppStyles.h1,
        ),
      ],
    );
  }
}
