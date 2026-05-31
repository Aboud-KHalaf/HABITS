import 'package:hive_ce/hive.dart';
import '../../../../features/habits/data/models/habit_completion_model.dart';
import '../../../../features/habits/data/models/habit_model.dart';

abstract class AnalyticsLocalDataSource {
  Future<List<HabitModel>> getAllHabits();
  Future<List<HabitCompletionModel>> getAllCompletions();
}

class AnalyticsLocalDataSourceImpl implements AnalyticsLocalDataSource {
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
  Future<List<HabitModel>> getAllHabits() async {
    final box = await _getHabitsBox();
    return box.values.toList();
  }

  @override
  Future<List<HabitCompletionModel>> getAllCompletions() async {
    final box = await _getCompletionsBox();
    return box.values.toList();
  }
}
