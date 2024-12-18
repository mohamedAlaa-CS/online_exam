import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/widgets/title_of_view.dart';
import 'package:online_exam/domin/entities/explor_entity/subject_entity.dart';
import 'package:online_exam/presentation/exam/view_model/exam_contract.dart';
import 'package:online_exam/presentation/exam/view_model/exam_view_model.dart';
import 'package:online_exam/presentation/exam/widgets/exam_list_view.dart';

class ExamView extends StatefulWidget {
  const ExamView({super.key});

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  ExamViewModel viewModel = getIt<ExamViewModel>();
  late SubjectEntity subject;
  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    subject = ModalRoute.of(context)?.settings.arguments as SubjectEntity;
    viewModel.doAction(LoadExamsAction(subject.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TitleOfView(title: subject.name),
                ExamListView(staticImage: subject.image),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
