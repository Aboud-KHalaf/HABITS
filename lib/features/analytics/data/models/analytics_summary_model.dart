import '../../domain/entities/analytics_summary_entity.dart';
import 'heatmap_day_model.dart';

class AnalyticsSummaryModel {
  final int currentStreak;
  final int bestStreak;
  final double completionRate;
  final int totalDays;
  final List<double> weeklyPerformance;
  final List<HeatmapDayModel> history90Days;

  const AnalyticsSummaryModel({
    required this.currentStreak,
    required this.bestStreak,
    required this.completionRate,
    required this.totalDays,
    required this.weeklyPerformance,
    required this.history90Days,
  });

  AnalyticsSummaryEntity toEntity() {
    return AnalyticsSummaryEntity(
      currentStreak: currentStreak,
      bestStreak: bestStreak,
      completionRate: completionRate,
      totalDays: totalDays,
      weeklyPerformance: weeklyPerformance,
      history90Days: history90Days.map((e) => e.toEntity()).toList(),
    );
  }
