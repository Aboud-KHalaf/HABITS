import '../../domain/entities/habit_completion_entity.dart';
import '../../domain/entities/habit_entity.dart';
import '../../domain/enums/habit_frequency.dart';
import '../../domain/repositories/habit_repository.dart';
import '../datasources/habit_local_datasource.dart';
import '../mappers/habit_mapper.dart';

class HabitRepositoryImpl implements HabitRepository {
  final HabitLocalDataSource _localDataSource;

  HabitRepositoryImpl(this._localDataSource);

  @override
  Future<void> createHabit(HabitEntity habit) async {
    final model = HabitMapper.toModel(habit);
    await _localDataSource.saveHabit(model);
  }

  @override
  Future<List<HabitEntity>> getHabits() async {
    final models = await _localDataSource.getHabits();
    return models.map((m) => HabitMapper.toEntity(m)).toList();
  }

  @override
  Future<void> updateHabit(HabitEntity habit) async {
    final model = HabitMapper.toModel(habit);
    await _localDataSource.updateHabit(model);
  }

  @override
  Future<void> deleteHabit(String habitId) async {
    await _localDataSource.deleteHabit(habitId);
  }

  @override
  Future<void> completeHabit(HabitCompletionEntity completion) async {
    final model = HabitCompletionMapper.toModel(completion);
    await _localDataSource.saveHabitCompletion(model);
  }

  @override
  Future<List<HabitEntity>> getTodayHabits() async {
    final models = await _localDataSource.getHabits();
    final today = DateTime.now();
    final currentWeekDay = today.weekday;

    final entities = models.map((m) => HabitMapper.toEntity(m)).toList();

    var filtered = entities.where((habit) {
      if (habit.frequency == HabitFrequency.daily) return true;
      if (habit.frequency == HabitFrequency.weekly) {
        return habit.selectedWeekDays.contains(currentWeekDay);
      }
      return false;
    }).toList();

    // Check completion status for each habit
    final habitsWithCompletion = <HabitEntity>[];
    for (final habit in filtered) {
      final completions = await _localDataSource.getHabitCompletions(habit.id);
      final isCompletedToday = completions.any((c) {
        final cDate = c.date;
        return cDate.year == today.year &&
            cDate.month == today.month &&
            cDate.day == today.day;
      });
      habitsWithCompletion.add(habit.copyWith(isCompletedToday: isCompletedToday));
    }

    return habitsWithCompletion;
  }

  @override
  Future<List<HabitCompletionEntity>> getHabitCompletions(String habitId) async {
    final models = await _localDataSource.getHabitCompletions(habitId);
    return models.map((m) => HabitCompletionMapper.toEntity(m)).toList();
  }
}
