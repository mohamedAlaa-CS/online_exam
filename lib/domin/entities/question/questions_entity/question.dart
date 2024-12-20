import 'answer.dart';
import 'exam.dart';
import 'subject.dart';

class Question {
  List<Answer>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  Subject? subject;
  Exam? exam;
  DateTime? createdAt;

  Question({
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
