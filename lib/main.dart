import 'package:flutter/material.dart';
import 'package:online_exam/core/cache/shared_preferences.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/online_exam.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferencesHelper.init();
  runApp(
    const OnlineExam(),
  );
}
