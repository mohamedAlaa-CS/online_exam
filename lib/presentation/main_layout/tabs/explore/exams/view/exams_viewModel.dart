import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/exam.dart';
import 'package:online_exam/domin/use_case/exam/get_exams_use_case.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/exams/view/exams_state.dart';

@injectable
class ExamsViewModel extends Cubit<ExamsViewState> {
  final GetAllExams getAllExams;

  ExamsViewModel(this.getAllExams) : super(ExamsInitialState());
  String? subjectId;
  void fetchExams() async {
    emit(ExamsInitialState());
    var result = await getAllExams.invoke(subjectId!);

    switch (result) {
      case Success<List<Exam>?>():
        if (result.data == null || result.data!.isEmpty) {
          emit(ExamsEmptyState());
        } else {
          emit(ExamsSuccessState(result.data!));
        }
        break;
      case Fail<List<Exam>?>():
        emit(ExamsErrorState(result.exception));
        break;
    }
  }
}
