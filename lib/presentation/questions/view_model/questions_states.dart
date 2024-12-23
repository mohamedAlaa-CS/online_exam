sealed class QuestionsStates {}

class QuestionsInitial extends QuestionsStates {}

class QuestionsLoadingState extends QuestionsStates {}

class ExamTimeoutState extends QuestionsStates {}

class AnswerSelectedState extends QuestionsStates {}
class NextQuestionState extends QuestionsStates {}
class PrevQuestionState extends QuestionsStates {}

class QuestionsSuccessState extends QuestionsStates {}

class QuestionsErrorState extends QuestionsStates {
  final String message;

  QuestionsErrorState(this.message);
}
