import 'package:hive_ce/hive.dart';
import '../models/habit_completion_model.dart';
import '../models/habit_model.dart';

abstract class HabitLocalDataSource {
  Future<void> saveHabit(HabitModel habit);
  Future<List<HabitModel>> getHabits();
  Future<void> updateHabit(HabitModel habit);
  Future<void> deleteHabit(String id);

  Future<void> saveHabitCompletion(HabitCompletionModel completion);
  Future<List<HabitCompletionModel>> getHabitCompletions(String habitId);
  Future<void> deleteCompletion(String completionId);
}

class HabitLocalDataSourceImpl implements HabitLocalDataSource {
  static const String habitsBoxName = 'habits_box';
  static const String completionsBoxName = 'habit_completions_box';

  Future<Box<HabitModel>> _getHabitsBox() async {
    if (Hive.isBoxOpen(habitsBoxName)) {
      return Hive.box<HabitModel>(habitsBoxName);
    }
    return Hive.openBox<HabitModel>(habitsBoxName);
  }

  Future<Box<HabitCompletionModel>> _getCompletionsBox() async {
    if (Hive.isBoxOpen(completionsBoxName)) {
      return Hive.box<HabitCompletionModel>(completionsBoxName);
    }
    return Hive.openBox<HabitCompletionModel>(completionsBoxName);
  }

  @override
  Future<void> saveHabit(HabitModel habit) async {
    final box = await _getHabitsBox();
    await box.put(habit.id, habit);
  }

  @override
  Future<List<HabitModel>> getHabits() async {
    final box = await _getHabitsBox();
    return box.values.toList();
  }

  @override
  Future<void> updateHabit(HabitModel habit) async {
    final box = await _getHabitsBox();
    await box.put(habit.id, habit);
  }

  @override
  Future<void> deleteHabit(String id) async {
    final box = await _getHabitsBox();
    await box.delete(id);

    // Also remove associated completions to keep data consistent
    final compBox = await _getCompletionsBox();
    final keysToRemove = compBox.values
        .where((c) => c.habitId == id)
        .map((c) => c.id)
        .toList();
    if (keysToRemove.isNotEmpty) {
      await compBox.deleteAll(keysToRemove);
    }
  }

  @override
  Future<void> saveHabitCompletion(HabitCompletionModel completion) async {
    final box = await _getCompletionsBox();
    await box.put(completion.id, completion);
  }

  @override
  Future<List<HabitCompletionModel>> getHabitCompletions(String habitId) async {
    final box = await _getCompletionsBox();
    return box.values.where((c) => c.habitId == habitId).toList();
  }

  @override
  Future<void> deleteCompletion(String completionId) async {
    final box = await _getCompletionsBox();
    await box.delete(completionId);
  }
}
