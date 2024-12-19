sealed class ExamAction {}

class LoadExamsAction extends ExamAction {
  final String subjectId;

  LoadExamsAction(this.subjectId);
}
