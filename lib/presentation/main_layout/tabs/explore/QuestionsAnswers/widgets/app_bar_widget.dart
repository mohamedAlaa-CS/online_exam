import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/view/questionanswer_state.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/view/questionanswer_viewModel.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            BlocProvider.of<QuestionsViewModel>(context).exanName ?? '',
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Image.asset(
                'assets/image/clock.png',
                width: 24,
                height: 30,
                fit: BoxFit.cover,
              ),
              horizontalSpace(4),
              BlocBuilder<QuestionsViewModel, QuestionAnswerState>(
                buildWhen: (previous, current) =>
                    current is QuestionAnswerTimeUpdatedState,
                builder: (context, state) {
                  String remainingTime = "00:00";

                  Color timerColor = AppColors.lightGreen;
                  if (state is QuestionAnswerTimeUpdatedState) {
                    remainingTime = state.remainingTime;
                    timerColor = state.timerColor;
                  }
                  return Text(
                    remainingTime,
                    style: TextStyles.font20Success400Weight
                        .copyWith(color: timerColor),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
