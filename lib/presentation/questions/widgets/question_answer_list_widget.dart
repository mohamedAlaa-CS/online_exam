import 'package:flutter/material.dart';
import 'package:online_exam/domin/entities/question/questions_entity/answer.dart';
import 'package:online_exam/presentation/questions/widgets/answer_radio_item_widget.dart';

class QuestionAnswerListWidget extends StatelessWidget {
  const QuestionAnswerListWidget({super.key, required this.answers});

  final List<AnswerEntity> answers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: answers
          .map(
            (answer) => AnswerRadioItemWidget(answer: answer),
          )
          .toList(),
    );
  }
}
