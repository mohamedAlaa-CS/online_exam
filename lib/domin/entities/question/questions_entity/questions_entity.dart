import 'question.dart';

class QuestionsEntity {
  String? message;
  List<Question>? questions;

  QuestionsEntity({this.message, this.questions});

  factory QuestionsEntity.fromJson(Map<String, dynamic> json) {
    return QuestionsEntity(
      message: json['message'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'questions': questions?.map((e) => e.toJson()).toList(),
      };
}
