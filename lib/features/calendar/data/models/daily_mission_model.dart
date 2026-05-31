class DailyMissionModel {
  final String habitId;
  final String habitName;
  final int iconCodePoint;
  final bool isCompleted;
  final DateTime date;

  const DailyMissionModel({
    required this.habitId,
    required this.habitName,
    required this.iconCodePoint,
    required this.isCompleted,
    required this.date,
  });
}
