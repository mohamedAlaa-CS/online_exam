import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/domin/entities/exam_entity.dart';
import 'package:online_exam/presentation/exam/widgets/exam_item_widget.dart';
import 'package:online_exam/presentation/main_layout/tabs/result/view_model/result_contract.dart';
import 'package:online_exam/presentation/main_layout/tabs/result/view_model/result_states.dart';
import 'package:online_exam/presentation/main_layout/tabs/result/view_model/result_view_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

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

class ResultListView extends StatefulWidget {
  const ResultListView({super.key});

  @override
  State<ResultListView> createState() => _ResultListViewState();
}

class _ResultListViewState extends State<ResultListView> {
  ResultViewModel viewModel = getIt<ResultViewModel>();

  @override
  initState() {
    super.initState();
    viewModel.doAction(GetExams());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<ResultViewModel, ResultStates>(
        builder: (context, state) {
          List<ExamEntity> exams = [];
          if (state is ResultSuccessState) {
            exams = state.exams;
          }
          if (state is ResultEmptyState) {
            return Expanded(
              child: LottieBuilder.asset('assets/lottie/not_found_data.json'),
            );
          }
          if (state is ResultErrorState) {
            return Center(child: Text(state.message));
          }
          return Expanded(
            child: ListView.builder(
              itemCount: exams.isEmpty ? 4 : exams.length,
              itemBuilder: (context, index) => SlideInLeft(
                duration: const Duration(milliseconds: 250),
                delay: Duration(milliseconds: index * 50),
                animate: true,
                child: Skeletonizer(
                  enabled: exams.isEmpty,
                  child: InkWell(
                    onTap: () {
                      if (exams.isNotEmpty) {
                        //---> nav to start exam
                        // context
                        //     .read<ExamViewModel>()
                        //     .doAction(NavigateToStartExamAction(exams[index]));
                      }
                    },
                    child: ExamItemWidget(
                      image: '',
                      examEntity: exams.isEmpty
                          ? ExamEntity(
                              id: '123',
                              title: 'hello my project',
                              duration: 25,
                              numberOfQuestions: 10,
                            )
                          : exams[index],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
