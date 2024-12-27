import 'package:online_exam/domin/entities/exam_entity.dart';

sealed class ResultStates {}

class ResultInitalState extends ResultStates {}

class ResultLoadingState extends ResultStates {}

class ResultSuccessState extends ResultStates {
  final List<ExamEntity> exams;

  ResultSuccessState(this.exams);
}

class ResultErrorState extends ResultStates {
  final String message;

  ResultErrorState(this.message);
}

class ResultEmptyState extends ResultStates {}
