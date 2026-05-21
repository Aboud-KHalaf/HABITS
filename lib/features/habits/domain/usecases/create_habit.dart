import '../entities/habit_entity.dart';
import '../repositories/habit_repository.dart';

class CreateHabit {
  final HabitRepository repository;

  CreateHabit(this.repository);

  Future<void> call(HabitEntity habit) async {
    await repository.createHabit(habit);
  }
}