import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/questions_answers.dart';
import 'package:online_exam/domin/use_case/exam/questions_answers_use_case.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/view/questionanswer_state.dart';

// ViewModel for fetching questions
@injectable
class QuestionsViewModel extends Cubit<QuestionAnswerState> {
  final QuestionsAnswersUseCase getQuestionsUseCase;

  QuestionsViewModel(this.getQuestionsUseCase)
      : super(QuestionAnswerInitialState());

  String? examId;
  List<Questions>? questions;
  int currentIndex = 0;
  Timer? timer;
  int duration = 0;
  String? exanName;
  int minutes = 0;
  int correctAnswersCount = 0;
  bool isLastQuestion = false;
  List<String?> selectedAnswers = [];

  void fetchQuestions() async {
    emit(QuestionAnswerLoadingState());

    if (examId == null) {
      emit(QuestionAnswerErrorState(Exception("Exam ID is null")));
      return;
    }

    var result = await getQuestionsUseCase.invoke(examId!);

    switch (result) {
      case Success<List<Questions>?>():
        if (result.data == null || result.data!.isEmpty) {
          emit(QuestionAnswerEmptyState());
        } else {
          questions = result.data;
          selectedAnswers = List<String?>.filled(
              questions!.length, null); // تهيئة قائمة الإجابات
          emit(QuestionAnswerSuccessState(questions![currentIndex]));
        }
        break;
      case Fail<List<Questions>?>():
        emit(QuestionAnswerErrorState(result.exception));
        break;
    }
  }

  void goToNextQuestion() {
    if (questions != null && currentIndex < questions!.length - 1) {
      currentIndex++;
      emit(QuestionAnswerSuccessState(questions![currentIndex]));
    }
    if (currentIndex == questions!.length - 1) {
      isLastQuestion = true;
    }
  }

  void goToPreviousQuestion() {
    if (questions != null && currentIndex > 0) {
      currentIndex--;
      isLastQuestion = false;
      emit(QuestionAnswerSuccessState(questions![currentIndex]));
    }
  }

  void setDuration(int minutes) {
    this.minutes = minutes;
    duration = minutes * 60;
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (duration > 0) {
        duration -= 1;
        Color timerColor =
            (duration <= (minutes * 30)) ? Colors.red : Colors.green;

        emit(QuestionAnswerTimeUpdatedState(formatTime(duration), timerColor));
      } else {
        timer.cancel();
        emit(QuestionAnswerTimeUpdatedState("00:00", Colors.red));
        onTimeUp();
      }
    });
  }

  void onTimeUp() {
    emit(QuestionAnswerTimeUpState());
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  void answerQuestion(String selectedKey) {
    final currentQuestion = questions![currentIndex];
    final previousAnswer = selectedAnswers[currentIndex];

    selectedAnswers[currentIndex] = selectedKey;

    if (previousAnswer != null) {
      if (currentQuestion.correctAnswerKey == previousAnswer) {
        correctAnswersCount--;
      }
    }

    if (currentQuestion.correctAnswerKey == selectedKey) {
      correctAnswersCount++;
      print("Correct Answer!");
    } else {
      print("Wrong Answer!");
    }

    emit(QuestionAnswerSuccessState(currentQuestion));
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
