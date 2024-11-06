import 'package:online_exam/domin/entities/subject.dart';

sealed class SubjectsViewState {}

class SubjectsInitialState extends SubjectsViewState {}

class SubjectsLoadingState extends SubjectsViewState {}

class SubjectsErrorState extends SubjectsViewState {
  final Exception? exception;
  SubjectsErrorState(this.exception);
}

class SubjectsSuccessState extends SubjectsViewState {
  final List<Subject>? subjects;
  SubjectsSuccessState(this.subjects);
}
