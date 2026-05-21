import '../enums/habit_completion_status.dart';

class HabitCompletionEntity {
  final String id;
  final String habitId;
  final DateTime date;
  final HabitCompletionStatus status;

  const HabitCompletionEntity({
    required this.id,
    required this.habitId,
    required this.date,
    required this.status,
  });
}