class CompletionSummaryEntity {
  final DateTime date;
  final int totalHabits;
  final int completedHabits;

  const CompletionSummaryEntity({
    required this.date,
    required this.totalHabits,
    required this.completedHabits,
  });

  double get completionPercentage =>
      totalHabits > 0 ? completedHabits / totalHabits : 0.0;

  CompletionSummaryEntity copyWith({
    DateTime? date,
    int? totalHabits,
    int? completedHabits,
  }) {
    return CompletionSummaryEntity(
      date: date ?? this.date,
      totalHabits: totalHabits ?? this.totalHabits,
      completedHabits: completedHabits ?? this.completedHabits,
    );
  }
}
