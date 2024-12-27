import 'package:injectable/injectable.dart';
import 'package:online_exam/data/contracts/result/result_offfline_data_sorce.dart';
import 'package:online_exam/domin/entities/exam_entity.dart';
import 'package:online_exam/domin/repositories/result_repository.dart';

@Injectable(as: ResultRepository)
class ResultRepoImpl extends ResultRepository {
  final ResultOfflineDataSource _resultOfflineDataSource;
  ResultRepoImpl(this._resultOfflineDataSource);
  @override
  Future<List<ExamEntity>> getExams() async {
    return await _resultOfflineDataSource.getResults();
  }
}
