// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_model.dart';

class EntryModelAdapter extends TypeAdapter<EntryModel> {
  @override
  final int typeId = 1;

  @override
  EntryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EntryModel()
      ..id = fields[0] as String
      ..habitId = fields[1] as String
      ..date = fields[2] as int
      ..isCompleted = fields[3] as bool
      ..completedAt = fields[4] as int?;
  }

  @override
  void write(BinaryWriter writer, EntryModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.habitId)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.isCompleted)
      ..writeByte(4)
      ..write(obj.completedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}