import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/design_system/app_borders.dart';

enum CompletionLevel { none, some, all, empty }

class BrutalCalendarCell extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final bool isToday;
  final CompletionLevel completionLevel;
  final VoidCallback onTap;

  const BrutalCalendarCell({
    super.key,
    required this.date,
    this.isSelected = false,
    this.isToday = false,
    this.completionLevel = CompletionLevel.none,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (completionLevel == CompletionLevel.empty) {
      return Container(
        margin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.outlineVariant,
            width: AppBorders.borderWidthThin,
            style: BorderStyle.none,
          ),
        ),
      );
    }

    final Color bgColor = _getBackgroundColor();
    final Color textColor = _getTextColor();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: bgColor,
          border: isSelected
              ? AppBorders.outlineThick
              : AppBorders.outlineMedium,
        ),
        child: Stack(
          children: [
            if (isToday && !isSelected)
              Positioned(
                top: 4,
                left: 4,
                child: Container(width: 8, height: 8, color: AppColors.white),
              ),
            Center(
              child: Text(
                '${date.day}',
                style: AppTypography.dataDisplay.copyWith(color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (completionLevel) {
      case CompletionLevel.all:
        return AppColors.primaryContainer;
      case CompletionLevel.some:
        return AppColors.primaryFixedDim;
      case CompletionLevel.none:
      case CompletionLevel.empty:
        return AppColors.transparent;
    }
  }

  Color _getTextColor() {
    if (completionLevel == CompletionLevel.all) {
      return AppColors.onPrimaryContainer;
    } else if (completionLevel == CompletionLevel.some) {
      return AppColors.onPrimaryFixedVariant;
    }
    return AppColors.textPrimary;
  }
}
