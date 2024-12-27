import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/entities/exam_entity.dart';
import 'package:online_exam/domin/repositories/result_repository.dart';

@injectable
class ResultUseCase {
  final ResultRepository _resultRepository;

  ResultUseCase(this._resultRepository);

  Future<List<ExamEntity>> getExams() async {
    return await _resultRepository.getExams();
  }
}
