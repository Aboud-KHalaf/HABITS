import '../entities/habit_entity.dart';
import '../repositories/habit_repository.dart';

class GetTodayHabits {
  final HabitRepository repository;

  GetTodayHabits(this.repository);

  Future<List<HabitEntity>> call() async {
    return await repository.getTodayHabits();
  }
}
