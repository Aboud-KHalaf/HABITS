import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_borders.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../domain/entities/habit_entity.dart';
import '../viewmodels/habits_viewmodel.dart';
import 'habit_card.dart';

class HabitsList extends ConsumerWidget {
  const HabitsList({super.key});

  void _toggleHabit(String id, HabitEntity habit, WidgetRef ref) {
    if (habit.isCompletedToday) {
      ref.read(habitsViewModelProvider.notifier).uncompleteHabit(id);
    } else {
      ref.read(habitsViewModelProvider.notifier).completeHabit(habit);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitsAsync = ref.watch(habitsViewModelProvider);
    final todayStr = DateFormat(
      'EEEE, MMM d',
    ).format(DateTime.now()).toUpperCase();

    return habitsAsync.when(
      data: (habits) {
        final pendingCount = habits.where((h) => !h.isCompletedToday).length;

        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          children: [
            // Date and Pending Header row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  todayStr,
                  style: AppTypography.headlineMd.copyWith(
                    color: AppColors.white,
                    fontSize: 18,
                    letterSpacing: 0.5,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.black,
                      width: AppBorders.borderWidthThin,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.black,
                        offset: Offset(3.0, 3.0),
                        blurRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Text(
                    '$pendingCount PENDING',
                    style: AppTypography.labelMono.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Habit cards
            ...habits.map((habit) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: HabitCard(
                  title: habit.name,
                  streak: 0,
                  isCompleted: habit.isCompletedToday,
                  onToggle: () => _toggleHabit(habit.id, habit, ref),
                ),
              );
            }),
          ],
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.electricGreen),
      ),
      error: (error, stackTrace) => Center(
        child: Text(
          'Error loading habits: $error',
          style: const TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
