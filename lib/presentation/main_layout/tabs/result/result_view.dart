import 'package:flutter/material.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/presentation/main_layout/tabs/result/widgets/result_list_view_widget.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.result,
              style: TextStyles.font20Black500Weight,
            ),
            verticalSpace(16),
            const ResultListView(),
          ],
        ),
      ),
    );
  }
}
