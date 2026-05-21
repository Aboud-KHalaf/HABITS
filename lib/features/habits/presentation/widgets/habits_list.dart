import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/widgets/brutal_section_title.dart';
import 'habit_card.dart';

class HabitsList extends StatelessWidget {
  const HabitsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        const BrutalSectionTitle(
          title: 'Mission Control',
          subtitle: 'Execute your daily tasks without fail.',
        ),
        AppSpacing.gapXL,
        HabitCard(
          title: 'Morning Workout',
          icon: '🏋️',
          isCompleted: true,
          onToggle: () {},
        ),
        AppSpacing.gapMD,
        HabitCard(
          title: 'Read 20 Pages',
          icon: '📚',
          isCompleted: false,
          onToggle: () {},
        ),
        AppSpacing.gapMD,
        HabitCard(
          title: 'Deep Work Session',
          icon: '💻',
          isCompleted: false,
          onToggle: () {},
        ),
      ],
    );
  }
}
