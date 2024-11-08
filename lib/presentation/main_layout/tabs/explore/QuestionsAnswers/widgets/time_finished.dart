import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/core/widgets/app_buttom.dart';

class TimeFinished extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;

  const TimeFinished({
    Key? key,
    required this.correctAnswers,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "Time's Up!",
          style: TextStyle(color: AppColors.error),
        ),
      ),
      actions: [
        Center(
          child: AppButton(
            text: "View Score",
            onPressed: () {
              context.pushNamedAndRemoveUntil(
                Routers.examResult,
                arguments: {
                  'score': correctAnswers,
                  'totalQuestions': totalQuestions,
                },
                predicate: (route) => false,
              );
            },
          ),
        ),
      ],
    );
  }
}
