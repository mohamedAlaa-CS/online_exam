import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/explor_entity/subject_entity.dart';
import 'package:online_exam/domin/repositories/subject_repository.dart';

@injectable
class GetAllSubjectUseCase {
  final SubjectRepository _subjectRepository;

  GetAllSubjectUseCase(this._subjectRepository);

  Future<Result<List<SubjectEntity>>> call() async {
    return await _subjectRepository.getAllSUbject();
  }
}
