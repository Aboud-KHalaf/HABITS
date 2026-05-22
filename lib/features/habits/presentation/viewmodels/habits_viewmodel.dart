import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/habit_entity.dart';
import '../../domain/entities/habit_completion_entity.dart';
import '../../domain/enums/habit_completion_status.dart';
import '../providers/habit_providers.dart';

class HabitsViewModel extends AsyncNotifier<List<HabitEntity>> {
  @override
  Future<List<HabitEntity>> build() async {
    return _fetchTodayHabits();
  }

  Future<List<HabitEntity>> _fetchTodayHabits() async {
    final getTodayHabits = ref.watch(getTodayHabitsUseCaseProvider);
    return getTodayHabits.call();
  }

  Future<void> completeHabit(HabitEntity habit) async {
    try {
      final completeHabitUseCase = ref.read(completeHabitUseCaseProvider);

      final completion = HabitCompletionEntity(
        id: '${habit.id}_${DateTime.now().millisecondsSinceEpoch}',
        habitId: habit.id,
        date: DateTime.now(),
        status: HabitCompletionStatus.completed,
      );

      await completeHabitUseCase.call(completion);
      
      // Refresh the entire list to reflect new completion status
      await Future.delayed(const Duration(milliseconds: 100));
      ref.invalidateSelf();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchTodayHabits());
  }
}

final habitsViewModelProvider = AsyncNotifierProvider<HabitsViewModel, List<HabitEntity>>(() {
  return HabitsViewModel();
});
