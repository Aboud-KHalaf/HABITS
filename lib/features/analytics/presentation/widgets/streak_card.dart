import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';
import 'insight_card.dart';

class StreakCard extends StatelessWidget {
  final String title;
  final int streak;
  final Widget icon;

  const StreakCard({
    super.key,
    required this.title,
    required this.streak,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InsightCard(
      title: title,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 8),
          Text(
            streak.toString(),
            style: AppTypography.headlineXl.copyWith(
              color: AppColors.primary,
              fontSize: 64,
            ),
          ),
        ],
      ),
    );
  }
}
