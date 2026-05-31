import 'package:habits/features/habits/data/models/habit_model.dart';

import '../../domain/entities/calendar_day_entity.dart';
import '../../domain/entities/completion_summary_entity.dart';
import '../../domain/entities/daily_mission_entity.dart';
import '../../domain/repositories/calendar_repository.dart';
import '../datasources/calendar_local_datasource.dart';
import '../mappers/calendar_mapper.dart';
import '../models/calendar_day_model.dart';
import '../models/completion_summary_model.dart';
import '../models/daily_mission_model.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarLocalDatasourceImpl _datasource;

  CalendarRepositoryImpl(this._datasource);

  @override
  Future<List<CalendarDayEntity>> getMonthlyCompletions(
    int year,
    int month,
  ) async {
    final allHabits = await _datasource.getAllHabits();
    final completions = await _datasource.getCompletionsForMonth(year, month);
    final today = DateTime.now();
    final daysInMonth = DateTime(year, month + 1, 0).day;

    final entities = <CalendarDayEntity>[];

    for (int day = 1; day <= daysInMonth; day++) {
      final date = DateTime(year, month, day);

      final dayCompletions = completions
          .where((c) => _isSameDay(c.date, date))
          .toList();

      final applicableHabits = allHabits
          .where((h) => _isHabitApplicable(h, date))
          .toList();

      final completedCount = dayCompletions
          .where((c) => c.status == 'completed')
          .length;

      final model = CalendarDayModel(
        date: date,
        totalHabits: applicableHabits.length,
        completedHabits: completedCount,
        isCurrentMonth: true,
        isToday: _isSameDay(date, today),
      );

      entities.add(CalendarMapper.fromDayModel(model));
    }

    return entities;
  }

  @override
  Future<List<DailyMissionEntity>> getDailyMissions(DateTime date) async {
    final allHabits = await _datasource.getAllHabits();
    final completions = await _datasource.getCompletionsForDate(date);

    final missions = <DailyMissionEntity>[];

    for (final habit in allHabits) {
      if (!_isHabitApplicable(habit, date)) continue;

      final isCompleted = completions.any(
        (c) => c.habitId == habit.id && c.status == 'completed',
      );

      final model = DailyMissionModel(
        habitId: habit.id,
        habitName: habit.name,
        iconCodePoint: habit.iconCodePoint,
        isCompleted: isCompleted,
        date: date,
      );

      missions.add(CalendarMapper.fromMissionModel(model));
    }

    return missions;
  }

  @override
  Future<CompletionSummaryEntity> getCompletionSummary(DateTime date) async {
    final missions = await getDailyMissions(date);
    final completed = missions.where((m) => m.isCompleted).length;

    final model = CompletionSummaryModel(
      date: date,
      totalHabits: missions.length,
      completedHabits: completed,
    );

    return CalendarMapper.fromSummaryModel(model);
  }

  bool _isHabitApplicable(HabitModel habit, DateTime date) {
    if (habit.frequency == 'daily') return true;
    if (habit.frequency == 'weekly') {
      return habit.selectedWeekDays.contains(date.weekday);
    }
    return false;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
