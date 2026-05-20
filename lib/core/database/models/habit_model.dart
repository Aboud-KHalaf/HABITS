import 'package:hive/hive.dart';

part 'habit_model.g.dart';

@HiveType(typeId: 0)
class HabitModel extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String? description;

  @HiveField(3)
  late List<int> scheduledDays;

  @HiveField(4)
  late int createdAt;

  @HiveField(5)
  late bool isArchived;

  @HiveField(6)
  late int? reminderTime;

  @HiveField(7)
  late String color;
}