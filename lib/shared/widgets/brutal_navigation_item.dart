import 'package:flutter/material.dart';
import '../design_system/app_colors.dart';
import '../design_system/app_spacing.dart';
import '../design_system/app_typography.dart';
import '../design_system/app_borders.dart';

/// A reusable navigation item for Rails or Bottom Navigation in Neo-Brutalist style.
class BrutalNavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const BrutalNavigationItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.surfaceContainerHigh : Colors.transparent,
          border: isSelected
              ? const Border(left: BorderSide(color: AppColors.neonYellow, width: AppBorders.borderWidthThin))
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.neonYellow : AppColors.onSurfaceVariant,
            ),
            AppSpacing.gapWXS,
            Text(
              label.toUpperCase(),
              style: AppTypography.labelMono.copyWith(
                color: isSelected ? AppColors.white : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
