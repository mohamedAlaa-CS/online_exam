import 'package:online_exam/domin/entities/explor_entity/subject_entity.dart';

sealed class SubjectAction {}

class GetAllSubjectsAction extends SubjectAction {}

class SerchSubjectsAction extends SubjectAction {
  final String searchText;

  SerchSubjectsAction(this.searchText);
}

class NavToExamViewAction extends SubjectAction {
  final SubjectEntity subject;

  NavToExamViewAction(this.subject);
}
