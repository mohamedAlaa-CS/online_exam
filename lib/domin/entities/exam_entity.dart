import 'package:hive_flutter/hive_flutter.dart';
part 'exam_entity.g.dart';
@HiveType(typeId: 1)
class ExamEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final int duration;
  @HiveField(3)
  final int numberOfQuestions;

  ExamEntity({
    required this.id,
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
  });
}
