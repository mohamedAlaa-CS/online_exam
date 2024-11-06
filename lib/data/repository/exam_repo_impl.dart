// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/contracts/exam/exam_offline_datasource.dart';
import 'package:online_exam/data/contracts/exam/exam_online_datasource.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/exam.dart';
import 'package:online_exam/domin/entities/questions_answers.dart';
import 'package:online_exam/domin/entities/subject.dart';
import 'package:online_exam/domin/repositories/exam_repository.dart';

@Injectable(as: ExamRepository)
class ExamRepoImpl implements ExamRepository {
  ExamOfflineDatasource examOfflineDatasource;
  ExamOnlineDatasource examOnlineDatasource;
  ExamRepoImpl({
    required this.examOfflineDatasource,
    required this.examOnlineDatasource,
  });

  @override
  Future<Result<List<Subject>?>> getAllSubjects() {
    return examOnlineDatasource.getAllSubjects();
  }

  @override
  Future<Result<List<Exam>?>> getExamsBySubjectId(String subjectId) {
    return examOnlineDatasource.getExamsBySubjectId(subjectId);
  }

  @override
  Future<Result<List<Questions>?>> getQuestionsAnswersByExamId(String examId) {
    return examOnlineDatasource.getQuestionsAnswersByExamId(examId);
  }
}
