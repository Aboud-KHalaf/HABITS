import 'package:flutter/material.dart';

enum AppTab {
  dashboard(
    Icons.grid_view_rounded,
    'Dashboard',
    '/',
  ),
  calendar(
    Icons.calendar_month_outlined,
    'Calendar',
    '/calendar',
  ),
  analytics(
    Icons.bar_chart_outlined,
    'Analytics',
    '/analytics',
  ),
  profile(
    Icons.person_outline,
    'Profile',
    '/profile',
  );

  final IconData icon;
  final String label;
  final String route;

  const AppTab(this.icon, this.label, this.route);

  static AppTab fromRoute(String route) {
    return AppTab.values.firstWhere(
      (tab) => tab.route == route,
      orElse: () => AppTab.values.first,
    );
  }
}
