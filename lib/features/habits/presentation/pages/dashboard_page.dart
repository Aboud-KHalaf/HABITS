import 'package:flutter/material.dart';
import '../../../../shared/layouts/adaptive_scaffold.dart';
import '../widgets/habits_list.dart';
import '../widgets/dashboard_analytics_panel.dart';
import '../widgets/dashboard_navigation_rail.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_borders.dart';
import '../../../../shared/design_system/app_typography.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      // The main content area
      body: const HabitsList(),

      // Mobile setup
      mobileAppBar: AppBar(
        leading: const Center(
          child: Icon(
            Icons.terminal,
            color: AppColors.white,
            size: 28,
          ),
        ),
        title: const Text(
          'HABITS',
          style: TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontWeight: FontWeight.w900,
            fontSize: 28,
            letterSpacing: 0.5,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.settings,
              color: AppColors.white,
              size: 28,
            ),
          ),
        ],
        backgroundColor: AppColors.black,
        elevation: 0,
        shape: const Border(
          bottom: BorderSide(
            color: AppColors.outlineVariant,
            width: AppBorders.borderWidthThin,
          ),
        ),
      ),

      mobileBottomNavigation: Container(
        height: 76,
        color: AppColors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.electricGreen,
                  border: Border.all(
                    color: AppColors.white,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.grid_view,
                      color: AppColors.black,
                      size: 22,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'DASHBOARD',
                      style: AppTypography.labelMono.copyWith(
                        color: AppColors.black,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.onSurfaceVariant,
                      size: 22,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'CALENDAR',
                      style: AppTypography.labelMono.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.bar_chart_outlined,
                      color: AppColors.onSurfaceVariant,
                      size: 22,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'ANALYTICS',
                      style: AppTypography.labelMono.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person_outline,
                      color: AppColors.onSurfaceVariant,
                      size: 22,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'PROFILE',
                      style: AppTypography.labelMono.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      mobileFloatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.electricGreen,
            border: Border.all(
              color: AppColors.black,
              width: AppBorders.borderWidthThin,
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.black,
                offset: Offset(4.0, 4.0),
                blurRadius: 0.0,
              ),
            ],
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.white,
            size: 32,
          ),
        ),
      ),

      // Tablet setup
      tabletNavigationRail: const DashboardNavigationRail(),
      tabletSidePanel: const DashboardAnalyticsPanel(),

      // Desktop setup
      desktopLeftNavigation: const DashboardNavigationRail(),
      desktopRightPanel: const DashboardAnalyticsPanel(),
    );
  }
}
