import '../entities/calendar_day_entity.dart';
import '../entities/completion_summary_entity.dart';
import '../entities/daily_mission_entity.dart';

abstract class CalendarRepository {
  Future<List<CalendarDayEntity>> getMonthlyCompletions(int year, int month);
  Future<List<DailyMissionEntity>> getDailyMissions(DateTime date);
  Future<CompletionSummaryEntity> getCompletionSummary(DateTime date);
}
