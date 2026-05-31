import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/design_system/app_borders.dart';

class CompletionLegend extends StatelessWidget {
  const CompletionLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _LegendItem(label: 'NONE', color: AppColors.transparent),
        AppSpacing.gapMD,
        _LegendItem(label: 'SOME', color: AppColors.primaryFixedDim),
        AppSpacing.gapMD,
        _LegendItem(label: 'ALL', color: AppColors.primaryContainer),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final String label;
  final Color color;

  const _LegendItem({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            border: AppBorders.outlineMedium,
          ),
        ),
        AppSpacing.gapWXS,
        Text(
          label,
          style: AppTypography.labelMono,
        ),
      ],
    );
  }
}
