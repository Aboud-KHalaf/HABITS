import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mission_card.dart';
import '../providers/calendar_provider.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../domain/entities/daily_mission_entity.dart';

class MissionSection extends ConsumerStatefulWidget {
  const MissionSection({super.key});

  @override
  ConsumerState<MissionSection> createState() => _MissionSectionState();
}

class _MissionSectionState extends ConsumerState<MissionSection> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMissionsForSelectedDate();
    });
  }

  void _loadMissionsForSelectedDate() {
    final selectedDate = ref.read(selectedDateViewModelProvider);
    ref.read(calendarViewModelProvider.notifier).loadMissionsForDate(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(selectedDateViewModelProvider);
    final calendarStateAsync = ref.watch(calendarViewModelProvider);

    ref.listen<DateTime>(selectedDateViewModelProvider, (prev, next) {
      if (prev != next) {
        ref
            .read(calendarViewModelProvider.notifier)
            .loadMissionsForDate(next);
      }
    });

    return calendarStateAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('$err')),
      data: (state) {
        final key = _dateKey(selectedDate);
        final missions = state.missionsByDate[key];

        if (missions == null || state.loadingDates.contains(key)) {
          if (missions == null && !state.loadingDates.contains(key)) {
            _loadMissionsForSelectedDate();
          }
          return _buildLoading();
        }

        return _buildMissionList(missions, selectedDate);
      },
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.xl),
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildMissionList(
    List<DailyMissionEntity> missions,
    DateTime selectedDate,
  ) {
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
              title: mission.habitName,
              isCompleted: mission.isCompleted,
              onToggle: (_) {
                ref
                    .read(calendarViewModelProvider.notifier)
                    .toggleMission(selectedDate, mission.habitId);
              },
            );
          }),
      ],
    );
  }

  String _dateKey(DateTime date) => '${date.year}-${date.month}-${date.day}';
}
