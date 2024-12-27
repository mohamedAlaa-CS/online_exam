import 'package:online_exam/domin/entities/exam_entity.dart';

abstract class ResultOfflineDataSource {
  Future<List<ExamEntity>> getResults();
}
