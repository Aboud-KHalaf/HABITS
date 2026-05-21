import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/habit_local_datasource.dart';
import '../../data/repositories/habit_repository_impl.dart';
import '../../domain/repositories/habit_repository.dart';
import '../../domain/usecases/complete_habit.dart';
import '../../domain/usecases/create_habit.dart';
import '../../domain/usecases/get_habits.dart';
import '../../domain/usecases/get_today_habits.dart';

// Local DataSource
final habitLocalDataSourceProvider = Provider<HabitLocalDataSource>((ref) {
  return HabitLocalDataSourceImpl();
});

// Repository
final habitRepositoryProvider = Provider<HabitRepository>((ref) {
  final dataSource = ref.watch(habitLocalDataSourceProvider);
  return HabitRepositoryImpl(dataSource);
});

// Use Cases
final getHabitsUseCaseProvider = Provider<GetHabits>((ref) {
  final repository = ref.watch(habitRepositoryProvider);
  return GetHabits(repository);
});

final getTodayHabitsUseCaseProvider = Provider<GetTodayHabits>((ref) {
  final repository = ref.watch(habitRepositoryProvider);
  return GetTodayHabits(repository);
});

final createHabitUseCaseProvider = Provider<CreateHabit>((ref) {
  final repository = ref.watch(habitRepositoryProvider);
  return CreateHabit(repository);
});

final completeHabitUseCaseProvider = Provider<CompleteHabit>((ref) {
  final repository = ref.watch(habitRepositoryProvider);
  return CompleteHabit(repository);
});
