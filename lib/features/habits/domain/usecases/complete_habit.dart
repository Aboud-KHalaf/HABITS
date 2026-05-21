import '../entities/habit_completion_entity.dart';
import '../repositories/habit_repository.dart';

class CompleteHabit {
  final HabitRepository repository;

  CompleteHabit(this.repository);

  Future<void> call(HabitCompletionEntity completion) async {
    await repository.completeHabit(completion);
  }
}