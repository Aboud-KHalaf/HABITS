import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../habits/domain/entities/habit_completion_entity.dart';
import '../../../habits/domain/enums/habit_completion_status.dart';
import '../../../habits/presentation/providers/habit_providers.dart';
import '../../domain/entities/daily_mission_entity.dart';
import '../providers/calendar_provider.dart';
import '../states/calendar_state.dart';

class CalendarViewModel extends AsyncNotifier<CalendarState> {
  @override
  Future<CalendarState> build() async {
    final now = DateTime.now();
    final currentMonth = DateTime(now.year, now.month, 1);
    final today = DateTime(now.year, now.month, now.day);

    final useCase = ref.read(getDailyMissionsUseCaseProvider);
    final todayMissions = await useCase(today);

    return CalendarState(
      currentMonth: currentMonth,
      missionsByDate: {_dateKey(today): todayMissions},
    );
  }

  Future<void> nextMonth() async {
    final next = DateTime(
      state.requireValue.currentMonth.year,
      state.requireValue.currentMonth.month + 1,
      1,
    );
    state = AsyncValue.data(state.requireValue.copyWith(currentMonth: next));
  }

  Future<void> previousMonth() async {
    final prev = DateTime(
      state.requireValue.currentMonth.year,
      state.requireValue.currentMonth.month - 1,
      1,
    );
    state = AsyncValue.data(state.requireValue.copyWith(currentMonth: prev));
  }

  Future<List<DailyMissionEntity>> loadMissionsForDate(DateTime date) async {
    final key = _dateKey(date);
    if (state.requireValue.missionsByDate.containsKey(key)) {
      return state.requireValue.missionsByDate[key]!;
    }

    state = AsyncValue.data(state.requireValue.copyWith(
      loadingDates: {...state.requireValue.loadingDates, key},
    ));

    final useCase = ref.read(getDailyMissionsUseCaseProvider);
    final missions = await useCase(date);

    state = AsyncValue.data(state.requireValue.copyWith(
      missionsByDate: {...state.requireValue.missionsByDate, key: missions},
      loadingDates: {...state.requireValue.loadingDates}..remove(key),
    ));

    return missions;
  }

  Future<void> toggleMission(DateTime date, String habitId) async {
    final key = _dateKey(date);
    final currentMissions = state.requireValue.missionsByDate[key] ?? [];
    final mission = currentMissions.where((m) => m.habitId == habitId).firstOrNull;
    final wasCompleted = mission?.isCompleted ?? false;

    if (wasCompleted) {
      final uncompleteHabit = ref.read(uncompleteHabitUseCaseProvider);
      await uncompleteHabit(habitId);
    } else {
      final completeHabit = ref.read(completeHabitUseCaseProvider);
      final completion = HabitCompletionEntity(
        id: '${habitId}_${DateTime.now().millisecondsSinceEpoch}',
        habitId: habitId,
        date: date,
        status: HabitCompletionStatus.completed,
      );
      await completeHabit(completion);
    }

    final useCase = ref.read(getDailyMissionsUseCaseProvider);
    final missions = await useCase(date);

    state = AsyncValue.data(state.requireValue.copyWith(
      missionsByDate: {...state.requireValue.missionsByDate, key: missions},
    ));
  }

  bool isLoadingDate(DateTime date) {
    final key = _dateKey(date);
    return state.requireValue.loadingDates.contains(key);
  }

  String _dateKey(DateTime date) =>
      '${date.year}-${date.month}-${date.day}';
}
