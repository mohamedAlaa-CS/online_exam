import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/subject.dart';
import 'package:online_exam/domin/repositories/exam_repository.dart';

@injectable
class SubjectUseCase {
  final ExamRepository examRepository;

  SubjectUseCase({required this.examRepository});

  Future<Result<List<Subject>?>> invoke() {
    return examRepository.getAllSubjects();
  }
}
