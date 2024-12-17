import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/explor_entity/subject_entity.dart';

abstract class SubjectOnlineDataSource {
  Future<Result<List<SubjectEntity>>> getAllSubject();
}
