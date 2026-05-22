import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_colors.dart';
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
            color: AppColors.white,
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
                    color: frequency == HabitFrequency.daily ? AppColors.white : AppColors.black,
                    border: Border.all(
                      color: AppColors.black,
                      width: frequency == HabitFrequency.daily ? 0 : AppBorders.borderWidthThin, // Hide inner border if selected
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'DAILY',
                      style: AppTypography.headlineMd.copyWith(
                        color: frequency == HabitFrequency.daily ? AppColors.black : AppColors.white,
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
                    color: frequency == HabitFrequency.weekly ? AppColors.white : AppColors.black,
                    border: Border.all(
                      color: AppColors.black,
                      width: frequency == HabitFrequency.weekly ? 0 : AppBorders.borderWidthThin,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'WEEKLY',
                      style: AppTypography.headlineMd.copyWith(
                        color: frequency == HabitFrequency.weekly ? AppColors.black : AppColors.white,
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
              _buildDayCircle(1, 'M'),
              _buildDayCircle(2, 'T'),
              _buildDayCircle(3, 'W'),
              _buildDayCircle(4, 'T'),
              _buildDayCircle(5, 'F'),
              _buildDayCircle(6, 'S'),
              _buildDayCircle(7, 'S'),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildDayCircle(int day, String label) {
    final isSelected = selectedDays.contains(day);
    return GestureDetector(
      onTap: () => onDayToggled(day),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.electricGreen : AppColors.transparent,
        ),
        child: Center(
          child: Text(
            label,
            style: AppTypography.labelMono.copyWith(
              color: isSelected ? AppColors.black : AppColors.onSurfaceVariant,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
