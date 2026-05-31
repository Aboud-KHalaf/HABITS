import 'heatmap_day_entity.dart';

class AnalyticsSummaryEntity {
  final int currentStreak;
  final int bestStreak;
  final double completionRate; 
  final int totalDays;
  /// Contains 7 elements representing the completion performance from Monday (index 0) to Sunday (index 6).
  final List<double> weeklyPerformance;
  final List<HeatmapDayEntity> history90Days;

  const AnalyticsSummaryEntity({
    required this.currentStreak,
    required this.bestStreak,
    required this.completionRate,
    required this.totalDays,
    required this.weeklyPerformance,
    required this.history90Days,
  });
}