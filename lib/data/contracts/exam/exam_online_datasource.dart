import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/exam.dart';
import 'package:online_exam/domin/entities/questions_answers.dart';
import 'package:online_exam/domin/entities/subject.dart';

abstract class ExamOnlineDatasource {
  Future<Result<List<Subject>?>> getAllSubjects();
  Future<Result<List<Exam>?>> getExamsBySubjectId(String subjectId);
  Future<Result<List<Questions>?>> getQuestionsAnswersByExamId(String examId);
}
