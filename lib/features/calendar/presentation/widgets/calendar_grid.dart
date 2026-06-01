import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'brutal_calendar_cell.dart';
import '../providers/calendar_provider.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/design_system/app_colors.dart';

class CalendarGrid extends ConsumerWidget {
  const CalendarGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarStateAsync = ref.watch(calendarViewModelProvider);
    final selectedDate = ref.watch(selectedDateViewModelProvider);

    return calendarStateAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (err, _) => Center(child: Text('$err')),
      data: (calendarState) {
        final daysInMonth = DateUtils.getDaysInMonth(
          calendarState.currentMonth.year,
          calendarState.currentMonth.month,
        );
        final firstDayOffset = DateTime(
          calendarState.currentMonth.year,
          calendarState.currentMonth.month,
          1,
        ).weekday % 7;

        return Column(
          children: [
            _buildDaysOfWeek(),
            AppSpacing.gapSM,
            Container(height: 1, color: AppColors.border),
            AppSpacing.gapSM,
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1.0,
              ),
              itemCount: 42,
              itemBuilder: (context, index) {
                if (index < firstDayOffset ||
                    index >= firstDayOffset + daysInMonth) {
                  return BrutalCalendarCell(
                    date: DateTime.now(),
                    completionLevel: CompletionLevel.empty,
                    onTap: () {},
                  );
                }

                final day = index - firstDayOffset + 1;
                final cellDate = DateTime(
                  calendarState.currentMonth.year,
                  calendarState.currentMonth.month,
                  day,
                );

                final isSelected = DateUtils.isSameDay(cellDate, selectedDate);
                final isToday = DateUtils.isSameDay(cellDate, DateTime.now());

                final dateKey = _dateKey(cellDate);
                final missions = calendarState.missionsByDate[dateKey] ?? <dynamic>[];
                final completed = missions.where((m) => m.isCompleted).length;

                CompletionLevel level = CompletionLevel.none;
                if (missions.isNotEmpty && completed == missions.length) {
                  level = CompletionLevel.all;
                } else if (completed > 0) {
                  level = CompletionLevel.some;
                }

                return BrutalCalendarCell(
                  date: cellDate,
                  isSelected: isSelected,
                  isToday: isToday,
                  completionLevel: level,
                  onTap: () =>
                      ref.read(selectedDateViewModelProvider.notifier).selectDate(cellDate),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildDaysOfWeek() {
    const days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((day) {
        return Expanded(
          child: Center(
            child: Text(day, style: AppTypography.labelMono),
          ),
        );
      }).toList(),
    );
  }

  String _dateKey(DateTime date) => '${date.year}-${date.month}-${date.day}';
}
