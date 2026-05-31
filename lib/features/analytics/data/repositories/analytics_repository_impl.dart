import '../../../analytics/domain/entities/analytics_summary_entity.dart';
import '../models/analytics_summary_model.dart';
import '../models/heatmap_day_model.dart';
import '../../../analytics/domain/repositories/analytics_repository.dart';
import '../../../habits/domain/enums/habit_completion_status.dart';
import '../datasources/analytics_local_datasource.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final AnalyticsLocalDataSource _localDataSource;

  AnalyticsRepositoryImpl(this._localDataSource);

  @override
  Future<AnalyticsSummaryEntity> getAnalyticsSummary() async {
    final habits = await _localDataSource.getAllHabits();
    final allCompletions = await _localDataSource.getAllCompletions();

    if (habits.isEmpty) {
      return const AnalyticsSummaryModel(
        currentStreak: 0,
        bestStreak: 0,
        completionRate: 0.0,
        totalDays: 0,
        weeklyPerformance: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
        history90Days: [],
      ).toEntity();
    }

    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    // Group completions by date (normalized to midnight)
    final Map<DateTime, int> completionsByDate = {};
    for (var completion in allCompletions) {
      if (completion.status == HabitCompletionStatus.completed.name) {
        final date = DateTime(
          completion.date.year,
          completion.date.month,
          completion.date.day,
        );
        completionsByDate[date] = (completionsByDate[date] ?? 0) + 1;
      }
    }

    // 1. Total Days Since First Habit
    DateTime firstHabitDate = habits.first.createdAt;
    for (var h in habits) {
      if (h.createdAt.isBefore(firstHabitDate)) {
        firstHabitDate = h.createdAt;
      }
    }
    firstHabitDate = DateTime(
      firstHabitDate.year,
      firstHabitDate.month,
      firstHabitDate.day,
    );
    int totalDays = todayDate.difference(firstHabitDate).inDays + 1;

    // 2. Streaks (Simple implementation: consecutive days with at least 1 completion)
    int currentStreak = 0;
    int tempBestStreak = 0;
    int currentRun = 0;

    // We check from the oldest completion to today
    if (completionsByDate.isNotEmpty) {
      List<DateTime> activeDates = completionsByDate.keys.toList()..sort();
      if (activeDates.isNotEmpty) {
        DateTime iterDate = activeDates.first;
        while (iterDate.isBefore(todayDate) ||
            iterDate.isAtSameMomentAs(todayDate)) {
          if (completionsByDate.containsKey(iterDate)) {
            currentRun++;
            if (currentRun > tempBestStreak) {
              tempBestStreak = currentRun;
            }
          } else {
            currentRun = 0;
          }
          iterDate = iterDate.add(const Duration(days: 1));
        }
        currentStreak = currentRun;
      }
    }

    // 3. Completion Rate
    // In a real app, this would be computed by checking if they met all scheduled habits for the day.
    // For simplicity: (Total completions) / (Total scheduled habits over all days)
    // Let's approximate: 1 completion means 1 task done. Total scheduled is totalDays * habits.length
    int totalCompletions = completionsByDate.values.fold(0, (a, b) => a + b);
    double completionRate = (totalDays * habits.length) == 0
        ? 0.0
        : totalCompletions / (totalDays * habits.length);

    // 4. Weekly Performance (Mon-Sun)
    // Find the Monday of the current week
    int mondayOffset = todayDate.weekday - DateTime.monday;
    DateTime startOfWeek = todayDate.subtract(Duration(days: mondayOffset));
    List<double> weeklyPerf = List.filled(7, 0.0);

    for (int i = 0; i < 7; i++) {
      DateTime d = startOfWeek.add(Duration(days: i));
      int count = completionsByDate[d] ?? 0;
      weeklyPerf[i] = habits.isEmpty ? 0.0 : count / habits.length;
    }

    // 5. 90-Day History Heatmap
    List<HeatmapDayModel> history = [];
    DateTime start90Days = todayDate.subtract(const Duration(days: 89));
    for (int i = 0; i < 90; i++) {
      DateTime d = start90Days.add(Duration(days: i));
      history.add(
        HeatmapDayModel(
          date: d,
          completionsCount: completionsByDate[d] ?? 0,
          totalHabitsCount: habits.length,
        ),
      );
    }

    return AnalyticsSummaryModel(
      currentStreak: currentStreak,
      bestStreak: tempBestStreak,
      completionRate: completionRate,
      totalDays: totalDays,
      weeklyPerformance: weeklyPerf,
      history90Days: history,
    ).toEntity();
  }
}
