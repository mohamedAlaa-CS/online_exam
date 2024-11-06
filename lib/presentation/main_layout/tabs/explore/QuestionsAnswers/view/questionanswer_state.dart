import 'package:flutter/material.dart';
import 'package:online_exam/domin/entities/questions_answers.dart';

sealed class QuestionAnswerState {}

class QuestionAnswerInitialState extends QuestionAnswerState {}

class QuestionAnswerLoadingState extends QuestionAnswerState {}

class QuestionAnswerErrorState extends QuestionAnswerState {
  final Exception? exception;

  QuestionAnswerErrorState(this.exception);
}

class QuestionAnswerSuccessState extends QuestionAnswerState {
  final Questions question;

  QuestionAnswerSuccessState(this.question);
}

class QuestionAnswerEmptyState extends QuestionAnswerState {}

class QuestionAnswerTimeUpdatedState extends QuestionAnswerState {
  final String remainingTime;
  final Color timerColor;

  QuestionAnswerTimeUpdatedState(this.remainingTime, this.timerColor);
}

class QuestionAnswerTimeUpState extends QuestionAnswerState {}
