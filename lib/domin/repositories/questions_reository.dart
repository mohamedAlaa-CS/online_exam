import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/question/questions_entity/questions_entity.dart';

abstract class QuestionsRepository {
  Future<Result<QuestionsEntity>> getQuestionsOfExam(String examId);
}
