import 'package:hive/hive.dart';

part 'app_settings_model.g.dart';

@HiveType(typeId: 2)
class AppSettingsModel extends HiveObject {
  @HiveField(0)
  late bool isDarkMode;

  @HiveField(1)
  late String? selectedLanguage;

  @HiveField(2)
  late bool notificationsEnabled;

  @HiveField(3)
  late int? defaultReminderTime;

  @HiveField(4)
  late bool showStreaksOnDashboard;
}