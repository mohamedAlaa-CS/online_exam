class Exam {
  String? id;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  DateTime? createdAt;

  Exam({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        duration: json['duration'] as int?,
        subject: json['subject'] as String?,
        numberOfQuestions: json['numberOfQuestions'] as int?,
        active: json['active'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'duration': duration,
        'subject': subject,
        'numberOfQuestions': numberOfQuestions,
        'active': active,
        'createdAt': createdAt?.toIso8601String(),
      };
}
