import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/exam_entity.dart';
import 'package:online_exam/domin/entities/question/questions_entity/question.dart';
import 'package:online_exam/domin/entities/question/questions_entity/questions_entity.dart';
import 'package:online_exam/domin/use_case/questions_use_case.dart';
import 'package:online_exam/presentation/questions/view_model/questions_contract.dart';
import 'package:online_exam/presentation/questions/view_model/questions_states.dart';

@injectable
class QuestionViewModel extends Cubit<QuestionsStates> {
  final QuestionsUseCase _questionsUseCase;
  QuestionViewModel(this._questionsUseCase) : super(QuestionsInitial());

  late int time = (questionData?.questions?[0].exam?.duration! as int) * 60;
  late ValueNotifier<String> timeMessage = ValueNotifier('00:00');

  int currentQuestion = 0;
  late Timer timer;

  doAction(QuestionActions action) async {
    switch (action) {
      case LoadQuestions():
        {
          await _loadQuestions(action.examId);
        }
      case StartTimerAction():
        {
          _startTime();
        }
      case AnswerQuestionAction():
        {
          _selectAnswer(action.answer);
        }
      case NextQuestionAction():
        {
          _nextQuestion();
        }
      case PreviousQuestionAction():
        {
          _prevQuestion();
        }
    }
  }

  List<String>? selectedAnswer;
  late List<String?> correctAnswersList =
      questions?.map((question) => question.correct).toList() as List<String?>;

  QuestionsEntity? questionData;
  List<QuestionEntity>? questions;
  int correctAnswers = 0;

  /// Returns the [number] of correct answers
  int numberOfCorrectAnswers() {
    for (int i = 0; i < questions!.length; i++) {
      if (selectedAnswer![i] == correctAnswersList[i]) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  Future<void> _loadQuestions(String examId) async {
    emit(QuestionsLoadingState());
    var response = await _questionsUseCase.call(examId);

    switch (response) {
      case Success<QuestionsEntity>():
        {
          if (response.data.questions!.isEmpty) {
            emit(EmptyQuestionState());
          } else {
            questionData = response.data;
            questions = questionData?.questions;
            selectedAnswer =
                List.generate(questions?.length ?? 0, (index) => "");
            emit(QuestionsSuccessState());
            //---------> save exam to local storage <----------
            var exam = questions![0].exam!;
            var box = await Hive.openBox<ExamEntity>('exams');
            await box.add(
              ExamEntity(
                id: exam.id ?? '',
                title: exam.title ?? '',
                duration: exam.duration ?? 0,
                numberOfQuestions: exam.numberOfQuestions ?? 0,
              ),
            );
          }
        }
        break;
      case Fail<QuestionsEntity>():
        {
          var errorMessage = handellerErrorMessage(response.exception);
          emit(QuestionsErrorState(errorMessage));
        }
        break;
    }
  }

  void _selectAnswer(String answer) {
    selectedAnswer?[currentQuestion] = answer;
    emit(AnswerSelectedState());
  }

  void _nextQuestion() {
    if (currentQuestion == questions!.length - 1) {
      return;
    }
    currentQuestion++;
    emit(NextQuestionState());
  }

  void _prevQuestion() {
    if (currentQuestion == 0) {
      return;
    }
    currentQuestion--;

    emit(PrevQuestionState());
  }

  void _updateTimeString() {
    log('time: $time');
    String minutes = (time ~/ 60).toString();
    String seconds = (time % 60).toString();
    if (minutes.length == 1) {
      minutes = "0$minutes";
    }
    if (seconds.length == 1) {
      seconds = "0$seconds";
    }
    timeMessage.value = "$minutes:$seconds";
  }

  bool isDangerTime() {
    return time < (questionData?.questions?[0].exam?.duration as int) * 20;
  }

  void _startTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      time--;
      _updateTimeString();
      if (time == 0) {
        _handeTimeout();
      }
    });
  }

  void _handeTimeout() {
    timer.cancel();
    emit(ExamTimeoutState());
  }
}
