import 'package:habits/features/habits/data/models/habit_completion_model.dart';
import 'package:habits/features/habits/data/models/habit_model.dart';
import 'package:hive_ce/hive.dart';

abstract class CalendarLocalDatasource {
  Future<List<HabitModel>> getAllHabits();
  Future<List<HabitCompletionModel>> getCompletionsForMonth(
    int year,
    int month,
  );
  Future<List<HabitCompletionModel>> getCompletionsForDate(DateTime date);
}

class CalendarLocalDatasourceImpl implements CalendarLocalDatasource {
  static const String _habitsBoxName = 'habits_box';
  static const String _completionsBoxName = 'habit_completions_box';

  Future<Box<HabitModel>> _getHabitsBox() async {
    if (Hive.isBoxOpen(_habitsBoxName)) {
      return Hive.box<HabitModel>(_habitsBoxName);
    }
    return Hive.openBox<HabitModel>(_habitsBoxName);
  }

  Future<Box<HabitCompletionModel>> _getCompletionsBox() async {
    if (Hive.isBoxOpen(_completionsBoxName)) {
      return Hive.box<HabitCompletionModel>(_completionsBoxName);
    }
    return Hive.openBox<HabitCompletionModel>(_completionsBoxName);
  }

  @override
  Future<List<HabitModel>> getAllHabits() async {
    final box = await _getHabitsBox();
    return box.values.toList();
  }

  @override
  Future<List<HabitCompletionModel>> getCompletionsForMonth(
    int year,
    int month,
  ) async {
    final box = await _getCompletionsBox();
    return box.values.where((c) {
      final d = c.date;
      return d.year == year && d.month == month;
    }).toList();
  }

  @override
  Future<List<HabitCompletionModel>> getCompletionsForDate(
    DateTime date,
  ) async {
    final box = await _getCompletionsBox();
    return box.values.where((c) {
      final d = c.date;
      return d.year == date.year && d.month == date.month && d.day == date.day;
    }).toList();
  }
}
