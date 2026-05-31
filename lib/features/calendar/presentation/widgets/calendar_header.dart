import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/design_system/app_borders.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/design_system/app_colors.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime currentMonth;
  final VoidCallback onNextMonth;
  final VoidCallback onPreviousMonth;

  const CalendarHeader({
    super.key,
    required this.currentMonth,
    required this.onNextMonth,
    required this.onPreviousMonth,
  });

  @override
  Widget build(BuildContext context) {
    final monthFormat = DateFormat('MMMM yyyy');
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        border: AppBorders.outlineMedium,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavigationButton(
            icon: Icons.chevron_left,
            onTap: onPreviousMonth,
          ),
          Text(
            monthFormat.format(currentMonth).toUpperCase(),
            style: AppTypography.headlineMd,
          ),
          _NavigationButton(
            icon: Icons.chevron_right,
            onTap: onNextMonth,
          ),
        ],
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _NavigationButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          border: AppBorders.outlineMedium,
          color: AppColors.surfaceContainer,
        ),
        child: Icon(
          icon,
          color: AppColors.white,
          size: 24,
        ),
      ),
    );
  }
}
