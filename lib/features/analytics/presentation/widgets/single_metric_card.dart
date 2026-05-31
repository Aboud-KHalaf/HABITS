import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/design_system/app_colors.dart';
import 'insight_card.dart';

class SingleMetricCard extends StatelessWidget {
  final String title;
  final String metric;
  final Color? metricColor;

  const SingleMetricCard({
    super.key,
    required this.title,
    required this.metric,
    this.metricColor,
  });

  @override
  Widget build(BuildContext context) {
    return InsightCard(
      title: title,
      child: Text(
        metric,
        style: AppTypography.headlineXl.copyWith(
          color: metricColor ?? AppColors.textPrimary,
        ),
      ),
    );
  }
}}
