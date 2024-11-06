import 'package:online_exam/domin/entities/subject.dart';

class SubjectDto {
  SubjectDto({
    this.id,
    this.name,
    this.icon,
  });
  String? id;
  String? name;
  String? icon;

  SubjectDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    return map;
  }

  Subject toSubject() {
    return Subject(
      id: id,
      name: name,
      icon: icon,
    );
  }
}
