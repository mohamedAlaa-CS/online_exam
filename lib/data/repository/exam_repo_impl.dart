import 'package:injectable/injectable.dart';
import 'package:online_exam/data/contracts/exam/exam_online_data_source.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/exam_entity.dart';
import 'package:online_exam/domin/repositories/exam_repository.dart';

@Injectable(as: ExamRepository)
class ExamRepoImpl extends ExamRepository {
  final ExamOnlineDataSource _examOnlineDataSource;

  ExamRepoImpl(this._examOnlineDataSource);
  @override
  Future<Result<List<ExamEntity>>> getExamOfSubject(String subjectId) async {
    return await _examOnlineDataSource.getExamOfSubject(subjectId);
  }
}
