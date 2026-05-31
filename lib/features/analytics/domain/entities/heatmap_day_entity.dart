class HeatmapDayEntity {
  final DateTime date;
  final int completionsCount;
  final int totalHabitsCount;

  const HeatmapDayEntity({
    required this.date,
    required this.completionsCount,
    required this.totalHabitsCount,
  });

  /// Calculates a completion intensity from 0.0 to 1.0 (useful for UI shading)
  double get intensity =>
      totalHabitsCount == 0 ? 0.0 : completionsCount / totalHabitsCount;
}
