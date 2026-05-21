import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_borders.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/widgets/brutal_toggle.dart';

class HabitCard extends StatelessWidget {
  final String title;
  final String icon;
  final bool isCompleted;
  final VoidCallback onToggle;

  const HabitCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isCompleted,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCompleted ? AppColors.surfaceElevated : AppColors.surface,
        border: AppBorders.outlineThick,
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 24),
          ),
          AppSpacing.gapWMD,
          Expanded(
            child: Text(
              title.toUpperCase(),
              style: AppTypography.heading3.copyWith(
                color: isCompleted ? AppColors.textSecondary : AppColors.textPrimary,
                decoration: isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          AppSpacing.gapWMD,
          BrutalToggle(
            value: isCompleted,
            onChanged: (val) => onToggle(),
          ),
        ],
      ),
    );
  }
}
