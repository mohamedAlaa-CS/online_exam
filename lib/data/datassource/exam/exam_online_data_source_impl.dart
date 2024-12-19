import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/api_extentions.dart';
import 'package:online_exam/data/api/api_manager.dart';
import 'package:online_exam/data/contracts/exam/exam_online_data_source.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/exam_entity.dart';

@Injectable(as: ExamOnlineDataSource)
class ExamOnlineDataSourceImpl extends ExamOnlineDataSource {
  final ApiManager _apiManager;
  ExamOnlineDataSourceImpl(this._apiManager);
  @override
  Future<Result<List<ExamEntity>>> getExamOfSubject(String subjectId) async {
    return executeApi<List<ExamEntity>>(() async {
      var result = await _apiManager.getExamOfSubject(subjectId);
      return result.exams?.map((e) => e.toEntity()).toList();
    });
  }
}
