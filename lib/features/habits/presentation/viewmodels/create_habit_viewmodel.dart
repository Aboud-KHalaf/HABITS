import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/habit_entity.dart';
import 'habits_viewmodel.dart';
import '../../domain/enums/habit_frequency.dart';
import '../providers/habit_providers.dart';
import '../states/create_habit_state.dart';

class CreateHabitViewModel extends Notifier<CreateHabitState> {
  @override
  CreateHabitState build() {
    return const CreateHabitState();
  }

  void updateFrequency(HabitFrequency frequency) {
    state = state.copyWith(frequency: frequency);
  }

  void toggleWeekDay(int day) {
    final currentDays = List<int>.from(state.selectedWeekDays);
    if (currentDays.contains(day)) {
      currentDays.remove(day);
    } else {
      currentDays.add(day);
    }
    state = state.copyWith(selectedWeekDays: currentDays);
  }

  Future<void> submitHabit(String name, int iconCodePoint, {String? notes}) async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);
    try {
      final createHabit = ref.read(createHabitUseCaseProvider);
      
      final newHabit = HabitEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        iconCodePoint: iconCodePoint,
        frequency: state.frequency,
        selectedWeekDays: state.selectedWeekDays,
        notes: notes,
        createdAt: DateTime.now(),
        notificationId: Random().nextInt(1000000), // Random temporary ID
      );

      await createHabit.call(newHabit);
      
      state = state.copyWith(isSubmitting: false, isSuccess: true);
      
      // Invalidate HabitsViewModel so it fetches the new list
      ref.invalidate(habitsViewModelProvider);
      
    } catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());
    }
  }
}

final createHabitViewModelProvider = NotifierProvider<CreateHabitViewModel, CreateHabitState>(() {
  return CreateHabitViewModel();
});
