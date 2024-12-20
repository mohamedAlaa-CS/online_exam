import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/question/questions_entity/questions_entity.dart';
import 'package:online_exam/domin/repositories/questions_reository.dart';

@injectable
class QuestionsUseCase {
  final QuestionsRepository _questionsRepository;

  QuestionsUseCase(this._questionsRepository);

  Future<Result<QuestionsEntity>> call(String examId) async {
    return await _questionsRepository.getQuestionsOfExam(examId);
  }
}
