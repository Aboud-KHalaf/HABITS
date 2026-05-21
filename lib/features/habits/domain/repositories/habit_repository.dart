import '../entities/habit_entity.dart';
import '../entities/habit_completion_entity.dart';

abstract class HabitRepository {
  Future<void> createHabit(HabitEntity habit);

  Future<List<HabitEntity>> getHabits();

  Future<void> updateHabit(HabitEntity habit);

  Future<void> deleteHabit(String habitId);

  Future<void> completeHabit(HabitCompletionEntity completion);

  Future<List<HabitEntity>> getTodayHabits();

  Future<List<HabitCompletionEntity>> getHabitCompletions(String habitId);
}