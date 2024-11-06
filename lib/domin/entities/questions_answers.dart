class Answer {
  final String key;
  final String answerText;

  Answer({
    required this.key,
    required this.answerText,
  });
}

class Questions {
  final String id;
  final String questionText;
  final String correctAnswerKey;
  final List<Answer> answers;
  final String type;

  Questions({
    required this.id,
    required this.questionText,
    required this.correctAnswerKey,
    required this.answers,
    required this.type,
  });
}
