import 'package:online_exam/domin/entities/exam_entity.dart';

abstract class ResultRepository {
  Future<List<ExamEntity>> getExams();
}
