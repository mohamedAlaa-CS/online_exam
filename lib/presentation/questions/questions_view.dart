import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/dialogs/app_dialogs.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/domin/entities/question/questions_entity/answer.dart';
import 'package:online_exam/presentation/questions/view_model/question_view_model.dart';
import 'package:online_exam/presentation/questions/view_model/questions_contract.dart';
import 'package:online_exam/presentation/questions/view_model/questions_states.dart';
import 'package:online_exam/presentation/questions/widgets/next_and_prev_buttons.dart';
import 'package:online_exam/presentation/questions/widgets/question_answer_list_widget.dart';
import 'package:online_exam/presentation/questions/widgets/questions_app_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  var viewModel = getIt<QuestionViewModel>();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var examId = ModalRoute.of(context)!.settings.arguments as String;
      await viewModel.doAction(LoadQuestions(examId));
    });
    viewModel.doAction(StartTimerAction());
  }

  @override
  dispose() {
    viewModel.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<QuestionViewModel, QuestionsStates>(
        listener: (context, state) {
          if (state is ExamTimeoutState) {
            AppDialogs.showTimeOutDialog(context, () {
              context.pop();
              context.pushName(Routers.scoreView);
            });
          }
        },
        builder: (context, state) {
          if (state is EmptyQuestionState) {
            //----> empty question <--------
            return Scaffold(
              appBar: AppBar(title: const Text(AppStrings.exam)),
              body: Center(
                child: Lottie.asset('assets/lottie/not_found_data.json'),
              ),
            );
          }
          return Skeletonizer(
            enabled: viewModel.questionData == null,
            child: Scaffold(
              appBar: QuestionsAppBar(viewModel: viewModel),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              '${AppStrings.questions} ${viewModel.currentQuestion + 1} of ${viewModel.questions?.length}',
                            ),
                          ),
                          const SizedBox(height: 10),
                          //----> stepper of questions <--------
                          LinearProgressIndicator(
                            minHeight: 4.h,
                            value: viewModel.questions?.isEmpty ?? true
                                ? 0
                                : (viewModel.currentQuestion + 1) /
                                    viewModel.questions!.length,
                            backgroundColor: AppColors.black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.primary,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 10),
                          //--------> question <---------
                          InkWell(
                            onTap: () {
                              AppDialogs.showTimeOutDialog(context, () {
                                log('time out');
                                viewModel.timer.cancel();
                                context.pop();
                                context.pushName(
                                  Routers.scoreView,
                                  arguments: viewModel.numberOfCorrectAnswers(),
                                );
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                viewModel.questionData == null
                                    ? '***************************'
                                    : viewModel
                                        .questions![viewModel.currentQuestion]
                                        .question!,
                                style: TextStyles.font18Black500Weight,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          //--------> answers list display <---------
                          QuestionAnswerListWidget(
                            answers: viewModel.questions == null
                                ? [
                                    //----> for skeleton <---------
                                    AnswerEntity(
                                      answer: 'Answer 1',
                                      key: '1',
                                    ),
                                    AnswerEntity(
                                      answer: 'Answer 2',
                                      key: '2',
                                    ),
                                    AnswerEntity(
                                      answer: 'Answer 3',
                                      key: '3',
                                    ),
                                    AnswerEntity(
                                      answer: 'Answer 4',
                                      key: '4',
                                    ),
                                  ]
                                : viewModel
                                    .questions![viewModel.currentQuestion]
                                    .answers!,
                          ),
                        ],
                      ),
                    ),
                    //----> next and previous buttons <--------
                    Expanded(
                      flex: 1,
                      child: NextAndPrevButtons(
                        nextButtonOnPressed: () {
                          viewModel.doAction(NextQuestionAction());
                        },
                        prevButtonOnPressed: () {
                          viewModel.doAction(PreviousQuestionAction());
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
