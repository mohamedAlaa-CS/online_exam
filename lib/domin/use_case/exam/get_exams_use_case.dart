import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/exam.dart';
import 'package:online_exam/domin/repositories/exam_repository.dart';

@injectable
class GetAllExams {
  final ExamRepository examRepository;

  GetAllExams({required this.examRepository});

  Future<Result<List<Exam>?>> invoke(String subjectId) {
    return examRepository.getExamsBySubjectId(subjectId);
  }
}
