import 'package:online_exam/domin/entities/questions_answers.dart';

class QuestionsDTO {
  final String id;
  final String questionText;
  final String correctAnswerKey;
  final List<AnswerDTO> answers;
  final String type;

  QuestionsDTO({
    required this.id,
    required this.questionText,
    required this.correctAnswerKey,
    required this.answers,
    required this.type,
  });

  factory QuestionsDTO.fromJson(Map<String, dynamic> json) {
    return QuestionsDTO(
      id: json['_id'],
      questionText: json['question'],
      correctAnswerKey: json['correct'],
      answers: (json['answers'] as List)
          .map((answerJson) => AnswerDTO.fromJson(answerJson))
          .toList(),
      type: json['type'],
    );
  }

  Questions toEntity() {
    return Questions(
      id: id,
      questionText: questionText,
      correctAnswerKey: correctAnswerKey,
      answers: answers.map((answerDTO) => answerDTO.toEntity()).toList(),
      type: type,
    );
  }
}

class AnswerDTO {
  final String key;
  final String answerText;

  AnswerDTO({
    required this.key,
    required this.answerText,
  });

  factory AnswerDTO.fromJson(Map<String, dynamic> json) {
    return AnswerDTO(
      key: json['key'],
      answerText: json['answer'],
    );
  }

  Answer toEntity() {
    return Answer(
      key: key,
      answerText: answerText,
    );
  }
}
