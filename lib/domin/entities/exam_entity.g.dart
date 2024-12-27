// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExamEntityAdapter extends TypeAdapter<ExamEntity> {
  @override
  final int typeId = 1;

  @override
  ExamEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExamEntity(
      id: fields[0] as String,
      title: fields[1] as String,
      duration: fields[2] as int,
      numberOfQuestions: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ExamEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.numberOfQuestions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
