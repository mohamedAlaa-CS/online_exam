import 'package:online_exam/data/api/model/metadata.dart';

import 'exam.dart';

class ExamDto {
  String? message;
  Metadata? metadata;
  List<Exam>? exams;

  ExamDto({this.message, this.metadata, this.exams});

  factory ExamDto.fromJson(Map<String, dynamic> json) => ExamDto(
        message: json['message'] as String?,
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
        exams: (json['exams'] as List<dynamic>?)
            ?.map((e) => Exam.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'metadata': metadata?.toJson(),
        'exams': exams?.map((e) => e.toJson()).toList(),
      };
}
