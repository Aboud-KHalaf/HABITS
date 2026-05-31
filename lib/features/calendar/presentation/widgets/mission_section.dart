import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mission_card.dart';
import '../providers/calendar_provider.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/design_system/app_colors.dart';

class MissionSection extends ConsumerWidget {
  const MissionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the selected date to know which day's missions to display
    final selectedDate = ref.watch(selectedDateViewModelProvider);
    // Watch the calendar state to rebuild when missions change
    ref.watch(calendarViewModelProvider);

    // Read the missions for the specific date
    final missions = ref
        .read(calendarViewModelProvider.notifier)
        .getMissionsForDate(selectedDate);
    final completedCount = missions.where((m) => m.isCompleted).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OverflowBar(
          alignment: MainAxisAlignment.spaceBetween,
          overflowAlignment: OverflowBarAlignment.start,
          spacing: AppSpacing.sm,
          overflowSpacing: AppSpacing.xs,
          children: [
            Text("TODAY'S MISSION", style: AppTypography.headlineLg),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              color: AppColors.primaryContainer,
              child: Text(
                '$completedCount / ${missions.length} DONE',
                style: AppTypography.labelMono.copyWith(
                  color: AppColors.onPrimaryContainer,
                ),
              ),
            ),
          ],
        ),
        AppSpacing.gapLG,
        if (missions.isEmpty)
          Center(
            child: Text("NO MISSIONS FOR TODAY", style: AppTypography.bodyLg),
          )
        else
          ...missions.map((mission) {
            return MissionCard(
              title: mission.title,
              isCompleted: mission.isCompleted,
              onToggle: (val) {
                ref
                    .read(calendarViewModelProvider.notifier)
                    .toggleMission(selectedDate, mission.id);
              },
            );
          }),
      ],
    );
  }
}
