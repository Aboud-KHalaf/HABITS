import '../../domain/enums/habit_frequency.dart';

class CreateHabitState {
  final HabitFrequency frequency;
  final List<int> selectedWeekDays;
  final bool isSubmitting;
  final String? errorMessage;
  final bool isSuccess;

  const CreateHabitState({
    this.frequency = HabitFrequency.daily,
    this.selectedWeekDays = const [],
    this.isSubmitting = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  CreateHabitState copyWith({
    HabitFrequency? frequency,
    List<int>? selectedWeekDays,
    bool? isSubmitting,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return CreateHabitState(
      frequency: frequency ?? this.frequency,
      selectedWeekDays: selectedWeekDays ?? this.selectedWeekDays,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
