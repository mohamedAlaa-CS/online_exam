import 'package:online_exam/domin/entities/question/questions_entity/answer.dart';

class Answer {
  String? answer;
  String? key;

  Answer({this.answer, this.key});
  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      answer: json['answer'] as String?,
      key: json['key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['answer'] = answer;
    map['key'] = key;
    return map;
  }

  AnswerEntity toEntity() {
    return AnswerEntity(
      answer: answer,
      key: key,
    );
  }
}
