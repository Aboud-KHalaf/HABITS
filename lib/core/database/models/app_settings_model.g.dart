// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_model.dart';

class AppSettingsModelAdapter extends TypeAdapter<AppSettingsModel> {
  @override
  final int typeId = 2;

  @override
  AppSettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSettingsModel()
      ..isDarkMode = fields[0] as bool
      ..selectedLanguage = fields[1] as String?
      ..notificationsEnabled = fields[2] as bool
      ..defaultReminderTime = fields[3] as int?
      ..showStreaksOnDashboard = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, AppSettingsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.isDarkMode)
      ..writeByte(1)
      ..write(obj.selectedLanguage)
      ..writeByte(2)
      ..write(obj.notificationsEnabled)
      ..writeByte(3)
      ..write(obj.defaultReminderTime)
      ..writeByte(4)
      ..write(obj.showStreaksOnDashboard);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}