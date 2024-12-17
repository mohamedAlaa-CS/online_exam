import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/explor_entity/subject_entity.dart';

abstract class SubjectRepository {
  Future<Result<List<SubjectEntity>>> getAllSUbject();
}
