import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_borders.dart';
import '../../../../shared/design_system/app_typography.dart';
import 'habit_card.dart';

class HabitsList extends StatefulWidget {
  const HabitsList({super.key});

  @override
  State<HabitsList> createState() => _HabitsListState();
}

class _HabitsListState extends State<HabitsList> {
  final List<Map<String, dynamic>> _habits = [
    {
      'title': 'Cold Shower',
      'streak': 12,
      'isCompleted': false,
    },
    {
      'title': 'Deep Work',
      'streak': 45,
      'isCompleted': true,
    },
    {
      'title': 'Read 20 Pages',
      'streak': 5,
      'isCompleted': false,
    },
  ];

  void _toggleHabit(int index) {
    setState(() {
      _habits[index]['isCompleted'] = !_habits[index]['isCompleted'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final pendingCount = _habits.where((h) => !h['isCompleted']).length;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        // Date and Pending Header row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'MONDAY, OCT 23',
              style: AppTypography.headlineMd.copyWith(
                color: AppColors.white,
                fontSize: 18,
                letterSpacing: 0.5,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
        ..._habits.asMap().entries.map((entry) {
          final int index = entry.key;
          final Map<String, dynamic> habit = entry.value;

          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: HabitCard(
              title: habit['title'],
              streak: habit['streak'],
              isCompleted: habit['isCompleted'],
              onToggle: () => _toggleHabit(index),
            ),
          );
        }),
      ],
    );
  }
}
