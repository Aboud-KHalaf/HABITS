import 'package:hive_ce/hive.dart';

part 'habit_completion_model.g.dart';

@HiveType(typeId: 1)
class HabitCompletionModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String habitId;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final String status;

  HabitCompletionModel({
    required this.id,
    required this.habitId,
    required this.date,
    required this.status,
  });
}
