class DailyMissionEntity {
  final String habitId;
  final String habitName;
  final int iconCodePoint;
  final bool isCompleted;
  final DateTime date;

  const DailyMissionEntity({
    required this.habitId,
    required this.habitName,
    required this.iconCodePoint,
    required this.isCompleted,
    required this.date,
  });

  DailyMissionEntity copyWith({
    String? habitId,
    String? habitName,
    int? iconCodePoint,
    bool? isCompleted,
    DateTime? date,
  }) {
    return DailyMissionEntity(
      habitId: habitId ?? this.habitId,
      habitName: habitName ?? this.habitName,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date ?? this.date,
    );
  }
}
