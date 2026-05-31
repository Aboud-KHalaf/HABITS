import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../design_system/app_colors.dart';
import '../design_system/app_dimensions.dart';
import '../design_system/app_borders.dart';
import '../design_system/app_typography.dart';
import '../responsive/adaptive_layout.dart';
import '../widgets/add_habit_fab.dart';
import '../widgets/vertical_divider.dart';
import 'app_tab.dart';
import 'app_navigation_bar.dart';
import 'app_navigation_rail.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: _MobileShell(child: child),
      tablet: _TabletShell(child: child),
      desktop: _DesktopShell(child: child),
    );
  }
}

class _MobileShell extends StatelessWidget {
  final Widget child;

  const _MobileShell({required this.child});

  @override
  Widget build(BuildContext context) {
    final tab = AppTab.fromRoute(GoRouterState.of(context).matchedLocation);
    final isDashboard = tab == AppTab.dashboard;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'HABITS',
          style: TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontWeight: FontWeight.w900,
            fontSize: 28,
            letterSpacing: 0.5,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: AppBorders.borderWidthThin,
          ),
        ),
      ),
      body: SafeArea(child: child),
      bottomNavigationBar: AppNavigationBar(currentTab: tab),
      floatingActionButton: isDashboard ? const AddHabitFab() : null,
    );
  }
}

class _TabletShell extends StatelessWidget {
  final Widget child;

  const _TabletShell({required this.child});

  @override
  Widget build(BuildContext context) {
    final tab = AppTab.fromRoute(GoRouterState.of(context).matchedLocation);
    final isDashboard = tab == AppTab.dashboard;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: AppDimensions.sidebarWidthDesktop,
              child: AppNavigationRail(currentTab: tab),
            ),
            const VerticalDividerWidget(),
            Expanded(child: child),
          ],
        ),
      ),
      floatingActionButton: isDashboard ? const AddHabitFab() : null,
    );
  }
}

class _DesktopShell extends StatelessWidget {
  final Widget child;

  const _DesktopShell({required this.child});

  @override
  Widget build(BuildContext context) {
    final tab = AppTab.fromRoute(GoRouterState.of(context).matchedLocation);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: AppDimensions.sidebarWidthDesktop,
              child: AppNavigationRail(currentTab: tab),
            ),
            Container(
              width: AppBorders.borderWidthThin,
              color: AppColors.neonYellow,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: AppDimensions.contentMaxWidth,
                  ),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
