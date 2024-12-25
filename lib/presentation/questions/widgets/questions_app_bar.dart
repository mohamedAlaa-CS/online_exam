import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/presentation/questions/view_model/question_view_model.dart';

class QuestionsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const QuestionsAppBar({super.key, required this.viewModel});
  final QuestionViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Text(AppStrings.exam),
          const Spacer(),
          Image.asset(
            AppStrings.alarmImage,
            height: 30.h,
            width: 24.w,
          ),
          horizontalSpace(5),
          SizedBox(
            width: 55.w,
            child: viewModel.questionData == null
                ? const Text('00:00')
                : ValueListenableBuilder(
                    valueListenable: viewModel.timeMessage,
                    builder: (context, value, child) {
                      return Text(
                        ' $value',
                        style: TextStyle(
                          fontSize: 20,
                          color: viewModel.isDangerTime()
                              ? Colors.red
                              : Colors.green,
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
