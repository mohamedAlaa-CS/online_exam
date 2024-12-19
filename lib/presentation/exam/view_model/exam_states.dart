import 'package:online_exam/domin/entities/exam_entity.dart';

sealed class ExamStates {}

class ExamInitalState extends ExamStates {}

class ExamLoadingState extends ExamStates {}

class ExamSuccessState extends ExamStates {
  final List<ExamEntity> exams;

  ExamSuccessState(this.exams);
}

class ExamErrorState extends ExamStates {
  final String message;

  ExamErrorState(this.message);
}

class ExamEmptyState extends ExamStates {}
