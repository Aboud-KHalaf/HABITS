import 'package:flutter/material.dart';
import '../design_system/app_colors.dart';
import '../design_system/app_spacing.dart';
import '../design_system/app_typography.dart';

/// A structured section title for the UI.
class BrutalSectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const BrutalSectionTitle({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: AppTypography.headlineLg),
        if (subtitle != null) ...[
          AppSpacing.gapSM,
          Text(
            subtitle!,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.neonYellow,
            ),
          ),
        ],
      ],
    );
  }
}
