import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/question/questions_entity/questions_entity.dart';
import 'package:online_exam/domin/use_case/questions_use_case.dart';
import 'package:online_exam/presentation/questions/view_model/questions_contract.dart';
import 'package:online_exam/presentation/questions/view_model/questions_states.dart';

@injectable
class QuestionViewModel extends Cubit<QuestionsStates> {
  final QuestionsUseCase _questionsUseCase;
  QuestionViewModel(this._questionsUseCase) : super(QuestionsInitial());

  doAction(QuestionActions action) async {
    switch (action) {
      case LoadQuestions():
        {
          await _loadQuestions(action.examId);
        }
    }
  }

  _loadQuestions(String examId) async {
    log('examId: $examId');
    emit(QuestionsLoadingState());
    var response = await _questionsUseCase.call(examId);

    switch (response) {
      case Success<QuestionsEntity>():
        {
          emit(QuestionsSuccessState(response.data));
        }
        break;
      case Fail<QuestionsEntity>():
        {
          var errorMessage = handellerErrorMessage(response.exception);
          emit(QuestionsErrorState(errorMessage));
        }
        break;
    }
  }
}
