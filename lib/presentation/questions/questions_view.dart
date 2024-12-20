import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/presentation/questions/view_model/question_view_model.dart';
import 'package:online_exam/presentation/questions/view_model/questions_contract.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  var viewModel = getIt<QuestionViewModel>();

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    var examId = ModalRoute.of(context)!.settings.arguments as String;
    viewModel.doAction(LoadQuestions(examId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Questions'),
        ),
        body: const Center(
          child: Text('Questions'),
        ),
      ),
    );
  }
}
