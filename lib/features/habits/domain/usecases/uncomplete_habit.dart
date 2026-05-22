import '../repositories/habit_repository.dart';

class UncompleteHabit {
  final HabitRepository repository;

  UncompleteHabit(this.repository);

  Future<void> call(String habitId) async {
    await repository.uncompleteHabit(habitId);
  }
}

