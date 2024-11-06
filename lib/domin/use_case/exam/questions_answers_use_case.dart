import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/questions_answers.dart';
import 'package:online_exam/domin/repositories/exam_repository.dart';

@injectable
class QuestionsAnswersUseCase {
  ExamRepository getQuestionsAnswers;
  QuestionsAnswersUseCase(this.getQuestionsAnswers);

  Future<Result<List<Questions>?>> invoke(String examId) {
    return getQuestionsAnswers.getQuestionsAnswersByExamId(examId);
  }
}
