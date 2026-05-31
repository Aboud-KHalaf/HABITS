class CompletionSummaryModel {
  final DateTime date;
  final int totalHabits;
  final int completedHabits;

  const CompletionSummaryModel({
    required this.date,
    required this.totalHabits,
    required this.completedHabits,
  });
}
