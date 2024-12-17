import 'package:injectable/injectable.dart';
import 'package:online_exam/data/contracts/explor/subject_online_data_source.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/explor_entity/subject_entity.dart';
import 'package:online_exam/domin/repositories/subject_repository.dart';

@Injectable(as: SubjectRepository)
class SubjectRepoImpl extends SubjectRepository {
  final SubjectOnlineDataSource _subjectOnlineDataSource;
  //final SubjectOfflineDataSource _subjectOfflineDataSource;

  SubjectRepoImpl(this._subjectOnlineDataSource);
  @override
  Future<Result<List<SubjectEntity>>> getAllSUbject() {
    return _subjectOnlineDataSource.getAllSubject();
  }
}
