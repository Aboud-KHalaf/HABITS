import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/widgets/brutal_section_title.dart';

class DashboardAnalyticsPanel extends StatelessWidget {
  const DashboardAnalyticsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BrutalSectionTitle(
            title: 'Analytics',
            subtitle: 'Metrics & consistency tracking.',
          ),
          AppSpacing.gapLG,
          // Placeholder for actual analytics charts
          Expanded(
            child: Center(
              child: Text('Analytics Visuals Here'),
            ),
          )
        ],
      ),
    );
  }
}
