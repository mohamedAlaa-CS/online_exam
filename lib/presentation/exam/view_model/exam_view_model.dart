import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/exam_entity.dart';
import 'package:online_exam/domin/use_case/exam_use_case.dart';
import 'package:online_exam/presentation/exam/view_model/exam_contract.dart';
import 'package:online_exam/presentation/exam/view_model/exam_states.dart';

@injectable
class ExamViewModel extends Cubit<ExamStates> {
  final ExamUseCase _examUseCase;
  ExamViewModel(this._examUseCase) : super(ExamInitalState());

  void doAction(ExamAction action) async {
    switch (action) {
      case LoadExamsAction():
        {
          await _loadExamOfSubject(action.subjectId);
        }
    }
  }

  Future<void> _loadExamOfSubject(String subjectId) async {
    emit(ExamLoadingState());
    var response = await _examUseCase.call(subjectId: subjectId);

    switch (response) {
      case Success<List<ExamEntity>>():
        {
          if (response.data.isEmpty) {
            emit(ExamEmptyState());
          } else {
            emit(ExamSuccessState(response.data));
          }
        }
      case Fail<List<ExamEntity>>():
        {
          var errorMessage = handellerErrorMessage(response.exception);
          emit(ExamErrorState(errorMessage));
        }
    }
  }
}
