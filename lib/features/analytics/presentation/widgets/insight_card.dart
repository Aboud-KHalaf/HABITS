import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/widgets/brutal_card.dart';

class InsightCard extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? trailing;

  const InsightCard({
    super.key,
    required this.title,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return BrutalCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: trailing != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
            children: [
              Text(
                title.toUpperCase(),
                style: AppTypography.labelMono.copyWith(color: AppColors.textSecondary),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}}
