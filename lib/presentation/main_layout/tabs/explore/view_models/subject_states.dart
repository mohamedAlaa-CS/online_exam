import 'package:online_exam/domin/entities/explor_entity/subject_entity.dart';

sealed class SubjectStates {}

class SubjectInitalState extends SubjectStates {}

class GetAllSubjectLoading extends SubjectStates {}

class GetAllSubjectSuccess extends SubjectStates {
  final List<SubjectEntity> subjectList;
  GetAllSubjectSuccess(this.subjectList);
}

class GetAllSubjectError extends SubjectStates {
  final String message;
  GetAllSubjectError(this.message);
}
