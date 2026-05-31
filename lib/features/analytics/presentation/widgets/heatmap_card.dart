import 'package:flutter/material.dart';
import '../../domain/entities/heatmap_day_entity.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';
import 'insight_card.dart';

class HeatmapCard extends StatelessWidget {
  final List<HeatmapDayEntity> history;

  const HeatmapCard({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return InsightCard(
      title: '90 Day History',
      trailing: Text(
        'LAST 3 MONTHS',
        style: AppTypography.labelMono,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildGrid(),
          const SizedBox(height: 12),
          _buildLegend(),
        ],
      ),
    );
  }

  Widget _buildGrid() {
    // 7 rows (days of week), 13 columns (~90 days)
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 13,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: history.length,
      itemBuilder: (context, index) {
        final day = history[index];
        return Container(
          decoration: BoxDecoration(
            color: _getColorForIntensity(day.intensity),
            border: Border.all(
              color: AppColors.background,
              width: 1,
            ),
          ),
        );
      },
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Less',
          style: AppTypography.bodySmall,
        ),
        const SizedBox(width: 4),
        Container(width: 12, height: 12, color: AppColors.surfaceContainerHighest),
        const SizedBox(width: 4),
        Container(width: 12, height: 12, color: AppColors.primaryFixedDim),
        const SizedBox(width: 4),
        Text(
          'More',
          style: AppTypography.bodySmall,
        ),
      ],
    );
  }

  Color _getColorForIntensity(double intensity) {
    if (intensity == 0) return AppColors.surfaceContainerHighest;
    return AppColors.primaryFixedDim;
  }
}}
