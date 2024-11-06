import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/subject.dart';
import 'package:online_exam/domin/use_case/exam/subject_use_case.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/subjects/view/subject_state.dart';

@injectable
class SubjectsViewModel extends Cubit<SubjectsViewState> {
  final SubjectUseCase subjectUseCase;
  List<Subject>? originalSubjectsList;
  List<Subject>? filteredSubjectsList;
  final TextEditingController searchController = TextEditingController();

  SubjectsViewModel(this.subjectUseCase) : super(SubjectsInitialState()) {
    searchController.addListener(_onSearchChanged);
  }

  void fetchSubjects() async {
    emit(SubjectsLoadingState());

    var result = await subjectUseCase.invoke();

    switch (result) {
      case Success<List<Subject>?>():
        originalSubjectsList = result.data;
        filteredSubjectsList = List.from(originalSubjectsList!);
        emit(SubjectsSuccessState(filteredSubjectsList));
        break;

      case Fail<List<Subject>?>():
        emit(SubjectsErrorState(result.exception));
        break;
    }
  }

  void _onSearchChanged() {
    final query = searchController.text;
    if (query.isEmpty) {
      filteredSubjectsList = List.from(originalSubjectsList!);
    } else {
      filteredSubjectsList = originalSubjectsList?.where((subject) {
        return subject.name?.toLowerCase().contains(query.toLowerCase()) ??
            false;
      }).toList();
    }
    emit(SubjectsSuccessState(filteredSubjectsList));
  }

  void resetSearch() {
    filteredSubjectsList = List.from(originalSubjectsList!);
    emit(SubjectsSuccessState(filteredSubjectsList));
  }
}
