import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_borders.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../domain/enums/habit_frequency.dart';

class CreateHabitFrequencySelector extends StatelessWidget {
  final HabitFrequency frequency;
  final ValueChanged<HabitFrequency> onFrequencyChanged;
  final List<int> selectedDays;
  final ValueChanged<int> onDayToggled;

  const CreateHabitFrequencySelector({
    super.key,
    required this.frequency,
    required this.onFrequencyChanged,
    required this.selectedDays,
    required this.onDayToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '3. FREQUENCY',
          style: AppTypography.labelMono.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => onFrequencyChanged(HabitFrequency.daily),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: frequency == HabitFrequency.daily
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.surface,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.surface,
                      width: frequency == HabitFrequency.daily
                          ? 0
                          : AppBorders
                                .borderWidthThin, // Hide inner border if selected
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'DAILY',
                      style: AppTypography.headlineMd.copyWith(
                        color: frequency == HabitFrequency.daily
                            ? Theme.of(context).colorScheme.surface
                            : Theme.of(context).colorScheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => onFrequencyChanged(HabitFrequency.weekly),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: frequency == HabitFrequency.weekly
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.surface,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.surface,
                      width: frequency == HabitFrequency.weekly
                          ? 0
                          : AppBorders.borderWidthThin,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'WEEKLY',
                      style: AppTypography.headlineMd.copyWith(
                        color: frequency == HabitFrequency.weekly
                            ? Theme.of(context).colorScheme.surface
                            : Theme.of(context).colorScheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (frequency == HabitFrequency.weekly) ...[
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDayCircle(context, 1, 'M'),
              _buildDayCircle(context, 2, 'T'),
              _buildDayCircle(context, 3, 'W'),
              _buildDayCircle(context, 4, 'T'),
              _buildDayCircle(context, 5, 'F'),
              _buildDayCircle(context, 6, 'S'),
              _buildDayCircle(context, 7, 'S'),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildDayCircle(BuildContext context, int day, String label) {
    final isSelected = selectedDays.contains(day);
    return GestureDetector(
      onTap: () => onDayToggled(day),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
        ),
        child: Center(
          child: Text(
            label,
            style: AppTypography.labelMono.copyWith(
              color: isSelected
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
