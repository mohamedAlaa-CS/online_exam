import 'package:online_exam/domin/entities/exam.dart';

sealed class ExamsViewState {}

class ExamsInitialState extends ExamsViewState {}

class ExamsLoadingState extends ExamsViewState {}

class ExamsErrorState extends ExamsViewState {
  final Exception? exception;
  ExamsErrorState(this.exception);
}

class ExamsSuccessState extends ExamsViewState {
  final List<Exam>? exams;
  ExamsSuccessState(this.exams);
}

class ExamsEmptyState extends ExamsViewState {}
