import 'package:flutter/material.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/online_exam.dart';

void main() {
   configureDependencies(); 
  runApp(const OnlineExam());
}
