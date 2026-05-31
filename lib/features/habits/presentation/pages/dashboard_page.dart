import 'package:flutter/material.dart';
import '../../../../shared/responsive/adaptive_layout.dart';
import '../../../../shared/design_system/app_dimensions.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_borders.dart';
import '../widgets/habits_list.dart';
import '../widgets/dashboard_analytics_panel.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: const HabitsList(),
      tablet: const _WithSidePanel(width: AppDimensions.analyticsPanelWidthTablet),
      desktop: const _WithSidePanel(width: AppDimensions.analyticsPanelWidthDesktop),
    );
  }
}

class _WithSidePanel extends StatelessWidget {
  final double width;

  const _WithSidePanel({required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: const HabitsList()),
        Container(
          width: AppBorders.borderWidthThin,
          color: AppColors.neonYellow,
        ),
        SizedBox(
          width: width,
          child: const DashboardAnalyticsPanel(),
        ),
      ],
    );
  }
}
