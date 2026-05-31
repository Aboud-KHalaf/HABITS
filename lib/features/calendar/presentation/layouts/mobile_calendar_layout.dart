import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/calendar_header.dart';
import '../widgets/calendar_grid.dart';
import '../widgets/completion_legend.dart';
import '../widgets/selected_date_label.dart';
import '../widgets/mission_section.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../providers/calendar_provider.dart';

class MobileCalendarLayout extends ConsumerWidget {
  const MobileCalendarLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarState = ref.watch(calendarViewModelProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.margin),
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
          AppSpacing.gapXL,
          const SelectedDateLabel(),
          AppSpacing.gapLG,
          const MissionSection(),
        ],
      ),
    );
  }
}
