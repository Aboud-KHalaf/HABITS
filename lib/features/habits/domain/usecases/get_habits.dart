import '../entities/habit_entity.dart';
import '../repositories/habit_repository.dart';

class GetHabits {
  final HabitRepository repository;

  GetHabits(this.repository);

  Future<List<HabitEntity>> call() async {
    return await repository.getHabits();
  }
}