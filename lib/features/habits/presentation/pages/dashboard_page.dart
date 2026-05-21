import 'package:flutter/material.dart';
import '../../../../shared/layouts/adaptive_scaffold.dart';
import '../widgets/habits_list.dart';
import '../widgets/dashboard_analytics_panel.dart';
import '../widgets/dashboard_navigation_rail.dart';
import '../../../../shared/design_system/app_colors.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      // The main content area
      body: const HabitsList(),

      // Mobile setup
      mobileAppBar: AppBar(
        title: const Text(
          'HABITS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        shape: Border.all(color: AppColors.border, width: 1),
      ),
      mobileBottomNavigation: BottomNavigationBar(
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.electricBlue,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
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
