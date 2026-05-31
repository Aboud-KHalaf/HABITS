import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/design_system/app_borders.dart';
import '../../../../shared/widgets/brutal_checkbox.dart';

class MissionCard extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final ValueChanged<bool> onToggle;

  const MissionCard({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isCompleted
        ? AppColors.primaryContainer
        : AppColors.transparent;
    final borderColor = isCompleted
        ? AppColors.primaryContainer
        : AppColors.outlineVariant;
    final textStyle = AppTypography.headlineMd.copyWith(
      color: isCompleted ? AppColors.onPrimaryContainer : AppColors.textPrimary,
      decoration: isCompleted ? TextDecoration.lineThrough : null,
      decorationColor: AppColors.onPrimaryContainer,
      decorationThickness: 2.0,
    );

    return GestureDetector(
      onTap: () => onToggle(!isCompleted),
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: borderColor,
            width: AppBorders.borderWidthThin,
          ),
        ),
        child: Row(
          children: [
            BrutalCheckbox(value: isCompleted, onChanged: onToggle),
            AppSpacing.gapMD,
            Expanded(child: Text(title.toUpperCase(), style: textStyle)),
          ],
        ),
      ),
    );
  }
}
