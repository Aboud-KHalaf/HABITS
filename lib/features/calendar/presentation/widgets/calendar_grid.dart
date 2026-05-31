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
    final calendarState = ref.watch(calendarViewModelProvider);
    final selectedDate = ref.watch(selectedDateViewModelProvider);
    
    final daysInMonth = DateUtils.getDaysInMonth(
      calendarState.currentMonth.year,
      calendarState.currentMonth.month,
    );
    final firstDayOffset = DateTime(
      calendarState.currentMonth.year,
      calendarState.currentMonth.month,
      1,
    ).weekday % 7; // Sunday based

    return Column(
      children: [
        _buildDaysOfWeek(),
        AppSpacing.gapSM,
        Container(
          height: 1,
          color: AppColors.border,
        ),
        AppSpacing.gapSM,
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1.0,
          ),
          itemCount: 42, // 6 rows of 7
          itemBuilder: (context, index) {
            if (index < firstDayOffset || index >= firstDayOffset + daysInMonth) {
              return BrutalCalendarCell(
                date: DateTime.now(), // dummy
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
            
            // Mock completion level logic
            CompletionLevel level = CompletionLevel.none;
            if (day % 3 == 0) level = CompletionLevel.all;
            else if (day % 2 == 0) level = CompletionLevel.some;

            return BrutalCalendarCell(
              date: cellDate,
              isSelected: isSelected,
              isToday: isToday,
              completionLevel: level,
              onTap: () => ref.read(selectedDateViewModelProvider.notifier).selectDate(cellDate),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDaysOfWeek() {
    const days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((day) {
        return Expanded(
          child: Center(
            child: Text(
              day,
              style: AppTypography.labelMono,
            ),
          ),
        );
      }).toList(),
    );
  }
}
