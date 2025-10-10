import 'package:online_exam/domin/entities/exam_entity.dart';

sealed class ExamAction {}

class LoadExamsAction extends ExamAction {
  final String subjectId;

  LoadExamsAction(this.subjectId);
}

class NavigateToStartExamAction extends ExamAction {
  final ExamEntity exam;

  NavigateToStartExamAction(this.exam);
}
