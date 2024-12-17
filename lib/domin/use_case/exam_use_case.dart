import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/exam_entity.dart';
import 'package:online_exam/domin/repositories/exam_repository.dart';

@injectable
class ExamUseCase {
  final ExamRepository _examRepository;

  ExamUseCase(this._examRepository);

  Future<Result<List<ExamEntity>>> call({required String subjectId}) async {
    return await _examRepository.getExamOfSubject(subjectId);
  }
}
