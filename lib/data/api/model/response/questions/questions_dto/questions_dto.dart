import 'question.dart';

class QuestionsDto {
  String? message;
  List<Question>? questions;

  QuestionsDto({this.message, this.questions});

  factory QuestionsDto.fromJson(Map<String, dynamic> json) => QuestionsDto(
        message: json['message'] as String?,
        questions: (json['questions'] as List<dynamic>?)
            ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'questions': questions?.map((e) => e.toJson()).toList(),
      };
}
