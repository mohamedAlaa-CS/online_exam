sealed class QuestionActions {}

class LoadQuestions extends QuestionActions {
  final String examId;

  LoadQuestions(this.examId);
}

class StartTimerAction extends QuestionActions {}

class AnswerQuestionAction extends QuestionActions {
  final String answer;
  AnswerQuestionAction(this.answer);
}

class NextQuestionAction extends QuestionActions {}

class PreviousQuestionAction extends QuestionActions {}
