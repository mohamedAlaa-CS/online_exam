import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/api_extentions.dart';
import 'package:online_exam/data/api/api_manager.dart';
import 'package:online_exam/data/contracts/questions/question_online_data_source.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/question/questions_entity/questions_entity.dart';

@Injectable(as: QuestionOnlineDataSource)
class QuestionsOnlineDataSourseImpl extends QuestionOnlineDataSource {
  final ApiManager _apiManager;

  QuestionsOnlineDataSourseImpl(this._apiManager);
  @override
  Future<Result<QuestionsEntity>> getQuestionsOfExam(String examId) async {
    return executeApi<QuestionsEntity>(() async {
      var result = await _apiManager.getQuestionsOfExam(examId);
      return result.toEntity();
    });
  }
}
