import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/calendar_header.dart';
import '../widgets/calendar_grid.dart';
import '../widgets/completion_legend.dart';
import '../widgets/selected_date_label.dart';
import '../widgets/mission_section.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/design_system/app_borders.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../providers/calendar_provider.dart';

class DesktopCalendarLayout extends ConsumerWidget {
  const DesktopCalendarLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarState = ref.watch(calendarViewModelProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.margin * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalendarHeader(
                  currentMonth: calendarState.currentMonth,
                  onNextMonth: () => ref.read(calendarViewModelProvider.notifier).nextMonth(),
                  onPreviousMonth: () => ref.read(calendarViewModelProvider.notifier).previousMonth(),
                ),
                AppSpacing.gapLG,
                const CalendarGrid(),
                AppSpacing.gapMD,
                const CompletionLegend(),
              ],
            ),
          ),
        ),
        Container(
          width: 400,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: AppColors.border,
                width: AppBorders.borderWidthThin,
              ),
            ),
            color: AppColors.surfaceContainerLowest,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.margin * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SelectedDateLabel(),
                AppSpacing.gapLG,
                const MissionSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
