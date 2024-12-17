import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/presentation/exam/view_model/exam_contract.dart';
import 'package:online_exam/presentation/exam/view_model/exam_states.dart';

class ExamViewModel extends Cubit<ExamStates> {
  ExamViewModel() : super(ExamInitalState());

  void doAction(ExamAction action) {
    switch (action) {}
  }
}
