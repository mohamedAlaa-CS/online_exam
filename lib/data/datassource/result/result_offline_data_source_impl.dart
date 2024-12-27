import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/contracts/result/result_offfline_data_sorce.dart';
import 'package:online_exam/domin/entities/exam_entity.dart';

@Injectable(as: ResultOfflineDataSource)
class ResultOfflineDataSourceImpl extends ResultOfflineDataSource {
  @override
  Future<List<ExamEntity>> getResults() async {
    var box = await Hive.openBox<ExamEntity>('exams');
    return box.values.toList();
  }
}
