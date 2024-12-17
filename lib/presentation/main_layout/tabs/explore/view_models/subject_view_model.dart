import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/explor_entity/subject_entity.dart';
import 'package:online_exam/domin/use_case/explor/get_all_subject_use_case.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/view_models/subject_contract.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/view_models/subject_states.dart';

@injectable
class SubjectViewModel extends Cubit<SubjectStates> {
  final GetAllSubjectUseCase _allSubjectUseCase;
  SubjectViewModel(this._allSubjectUseCase) : super(SubjectInitalState());
  List<SubjectEntity>? subjectList;
  List<SubjectEntity>? searhcSubjectList;

  void doAction(SubjectAction action) async {
    switch (action) {
      case GetAllSubjectsAction():
        {
          await _getAllSubject();
        }
      case SerchSubjectsAction():
        {
          _searchSubject(action.searchText);
        }
    }
  }

  _getAllSubject() async {
    emit(GetAllSubjectLoading());
    var result = await _allSubjectUseCase.call();

    switch (result) {
      case Success<List<SubjectEntity>>():
        {
          subjectList = result.data;
          searhcSubjectList = List.from(subjectList ?? []);
          emit(GetAllSubjectSuccess(result.data));
        }
      case Fail<List<SubjectEntity>>():
        {
          var errorMesssage = handellerErrorMessage(result.exception);
          emit(GetAllSubjectError(errorMesssage));
        }
    }
  }

  _searchSubject(String searchText) {
    if (searchText.isEmpty) {
      searhcSubjectList = List.from(subjectList ?? []);
    } else {
      searhcSubjectList = subjectList
          ?.where(
            (element) => element.name.toLowerCase().contains(
                  searchText.toLowerCase(),
                ),
          )
          .toList();
      log('searhcSubjectList: $searhcSubjectList');
    }
    emit(SearchSubjectSuccess(searhcSubjectList ?? []));
  }
}
