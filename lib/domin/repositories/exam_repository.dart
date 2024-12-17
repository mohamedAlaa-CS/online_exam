import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/exam_entity.dart';

abstract class ExamRepository {
  Future<Result<List<ExamEntity>>> getExamOfSubject(String subjectId);
}
