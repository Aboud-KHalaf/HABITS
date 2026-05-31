import '../../domain/entities/heatmap_day_entity.dart';

class HeatmapDayModel {
  final DateTime date;
  final int completionsCount;
  final int totalHabitsCount;

  const HeatmapDayModel({
    required this.date,
    required this.completionsCount,
    required this.totalHabitsCount,
  });

  HeatmapDayEntity toEntity() {
    return HeatmapDayEntity(
      date: date,
      completionsCount: completionsCount,
      totalHabitsCount: totalHabitsCount,
    );
  }
