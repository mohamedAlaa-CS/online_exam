import 'package:online_exam/domin/entities/question/questions_entity/questions_entity.dart';

sealed class QuestionsStates {}

class QuestionsInitial extends QuestionsStates {}

class QuestionsLoadingState extends QuestionsStates {}

class QuestionsSuccessState extends QuestionsStates {
  final QuestionsEntity questionsEntity;

  QuestionsSuccessState(this.questionsEntity);
}

class QuestionsErrorState extends QuestionsStates {
  final String message;

  QuestionsErrorState(this.message);
}
