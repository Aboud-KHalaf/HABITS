import 'package:hive_ce/hive.dart';

part 'habit_model.g.dart';

@HiveType(typeId: 0)
class HabitModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int iconCodePoint;

  @HiveField(3)
  final String frequency;

  @HiveField(4)
  final List<int> selectedWeekDays;

  @HiveField(5)
  final DateTime? reminderTime;

  @HiveField(6)
  final String? notes;

  @HiveField(7)
  final DateTime createdAt;

  @HiveField(8)
  final int notificationId;

  HabitModel({
    required this.id,
    required this.name,
    required this.iconCodePoint,
    required this.frequency,
    required this.selectedWeekDays,
    this.reminderTime,
    this.notes,
    required this.createdAt,
    required this.notificationId,
  });
}
