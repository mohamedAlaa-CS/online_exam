import 'package:online_exam/domin/entities/exam.dart';

class ExamDto {
  String? id;
  String? title;
  int? duration;
  int? numberOfQuestions;
  String? subjectId;
  bool? active;

  ExamDto({
    this.id,
    this.title,
    this.duration,
    this.numberOfQuestions,
    this.subjectId,
    this.active,
  });

  ExamDto.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    duration = json['duration'];
    numberOfQuestions = json['numberOfQuestions'];
    subjectId = json['subject'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['duration'] = duration;
    map['numberOfQuestions'] = numberOfQuestions;
    map['subject'] = subjectId;
    map['active'] = active;
    return map;
  }

  Exam toExam() {
    return Exam(
      id: id,
      title: title,
      duration: duration,
      numberOfQuestions: numberOfQuestions,
      subjectId: subjectId,
      active: active,
    );
  }
}
