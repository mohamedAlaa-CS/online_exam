import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/api_extentions.dart';
import 'package:online_exam/data/api/api_manager.dart';
import 'package:online_exam/data/contracts/explor/subject_online_data_source.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/explor_entity/subject_entity.dart';

@Injectable(as: SubjectOnlineDataSource)
class SubjectOnlineDataSourceImple extends SubjectOnlineDataSource {
  final ApiManager _apiManager;

  SubjectOnlineDataSourceImple(this._apiManager);
  @override
  Future<Result<List<SubjectEntity>>> getAllSubject() async {
    return executeApi<List<SubjectEntity>>(() async {
      var result = await _apiManager.getAllSubject();
      return result.subjects?.map((subject) => subject.toEntity()).toList();
    });
  }
}
