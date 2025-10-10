import 'package:injectable/injectable.dart';
import 'package:online_exam/data/contracts/questions/question_online_data_source.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/question/questions_entity/questions_entity.dart';
import 'package:online_exam/domin/repositories/questions_reository.dart';

@Injectable(as: QuestionsRepository)
class QuestionRepoImpl extends QuestionsRepository {
  final QuestionOnlineDataSource _questionOnlineDataSource;

  QuestionRepoImpl(this._questionOnlineDataSource);
  @override
  Future<Result<QuestionsEntity>> getQuestionsOfExam(String examId) async {
    return await _questionOnlineDataSource.getQuestionsOfExam(examId);
  }
}
