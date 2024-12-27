import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/use_case/result_use_case.dart';
import 'package:online_exam/presentation/main_layout/tabs/result/view_model/result_contract.dart';
import 'package:online_exam/presentation/main_layout/tabs/result/view_model/result_states.dart';

@injectable
class ResultViewModel extends Cubit<ResultStates> {
  final ResultUseCase _resultUseCase;
  ResultViewModel(this._resultUseCase) : super(ResultInitalState());
  void doAction(ResultActions action) {
    switch (action) {
      case GetExams():
        {
          _getExams();
          break;
        }
    }
  }

  void _getExams() async {
    emit(ResultLoadingState());
    try {
      final exams = await _resultUseCase.getExams();
      if (exams.isEmpty) {
        emit(ResultEmptyState());
      } else {
        emit(ResultSuccessState(exams));
      }
    } catch (e) {
      emit(ResultErrorState(e.toString()));
    }
  }
}
