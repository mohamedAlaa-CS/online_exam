import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/api_extentions.dart';
import 'package:online_exam/data/api/api_manager.dart';
import 'package:online_exam/data/contracts/exam/exam_online_datasource.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/exam.dart';
import 'package:online_exam/domin/entities/questions_answers.dart';
import 'package:online_exam/domin/entities/subject.dart';

@Injectable(as: ExamOnlineDatasource)
class ExamOnlineDatasourceImpl implements ExamOnlineDatasource {
  ApiManager apiManager;
  ExamOnlineDatasourceImpl(this.apiManager);

  @override
  Future<Result<List<Subject>?>> getAllSubjects() {
    return executeApi<List<Subject>>(
      () async {
        var subjectsDto = await apiManager.getAllSubjects();
        var subjects = subjectsDto?.map((dto) => dto.toSubject()).toList();
        return subjects;
      },
    );
  }

  @override
  Future<Result<List<Exam>?>> getExamsBySubjectId(String subjectId) {
    return executeApi<List<Exam>>(
      () async {
        var examsDto = await apiManager.getExamsBySubjectId(subjectId);
        var exams = examsDto?.map((dto) => dto.toExam()).toList();
        return exams;
      },
    );
  }

  @override
  Future<Result<List<Questions>?>> getQuestionsAnswersByExamId(String examId) {
    return executeApi<List<Questions>>(
      () async {
        var questionsDto = await apiManager.getQuestionsByExamId(examId);
        var questions = questionsDto?.map((dto) => dto.toEntity()).toList();
        return questions;
      },
    );
  }
}
