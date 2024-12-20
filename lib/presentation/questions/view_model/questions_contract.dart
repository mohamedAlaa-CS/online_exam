sealed class QuestionActions {}

class LoadQuestions extends QuestionActions {
  final String examId;

  LoadQuestions(this.examId);
}
