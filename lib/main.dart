import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_exam/core/cache/shared_preferences.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/domin/entities/exam_entity.dart';
import 'package:online_exam/online_exam.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferencesHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(ExamEntityAdapter());
  

  runApp(const OnlineExam());
}
