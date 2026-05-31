import '../../domain/entities/calendar_day_entity.dart';
import '../../domain/entities/completion_summary_entity.dart';
import '../../domain/entities/daily_mission_entity.dart';
import '../models/calendar_day_model.dart';
import '../models/completion_summary_model.dart';
import '../models/daily_mission_model.dart';

class CalendarMapper {
  static CalendarDayEntity fromDayModel(CalendarDayModel model) {
    return CalendarDayEntity(
      date: model.date,
      totalHabits: model.totalHabits,
      completedHabits: model.completedHabits,
      isCurrentMonth: model.isCurrentMonth,
      isToday: model.isToday,
    );
  }

  static DailyMissionEntity fromMissionModel(DailyMissionModel model) {
    return DailyMissionEntity(
      habitId: model.habitId,
      habitName: model.habitName,
      iconCodePoint: model.iconCodePoint,
      isCompleted: model.isCompleted,
      date: model.date,
    );
  }

  static CompletionSummaryEntity fromSummaryModel(
      CompletionSummaryModel model) {
    return CompletionSummaryEntity(
      date: model.date,
      totalHabits: model.totalHabits,
      completedHabits: model.completedHabits,
    );
  }
}
