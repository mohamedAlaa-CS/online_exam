import 'answer.dart';
import 'exam.dart';
import 'subject.dart';

class QuestionEntity {
  List<AnswerEntity>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  SubjectEntity? subject;
  ExamEntity? exam;
  DateTime? createdAt;

  QuestionEntity({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });
}
