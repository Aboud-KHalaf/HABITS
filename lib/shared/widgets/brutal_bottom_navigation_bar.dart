import 'package:flutter/material.dart';
import '../design_system/app_borders.dart';
import 'brutal_navigation_item.dart';
// Note: You need to import the respective pages or handle navigation externally.
// Here we'll take a currentIndex and an onItemSelected callback.

class BrutalBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const BrutalBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: AppBorders.borderWidthThin,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            BrutalNavigationItem(
              icon: Icons.grid_view,
              label: 'DASHBOARD',
              isSelected: currentIndex == 0,
              onTap: () => onItemSelected(0),
              layout: NavigationItemLayout.bottom,
            ),
            BrutalNavigationItem(
              icon: Icons.calendar_month_outlined,
              label: 'CALENDAR',
              isSelected: currentIndex == 1,
              onTap: () => onItemSelected(1),
              layout: NavigationItemLayout.bottom,
            ),
            BrutalNavigationItem(
              icon: Icons.bar_chart_outlined,
              label: 'ANALYTICS',
              isSelected: currentIndex == 2,
              onTap: () => onItemSelected(2),
              layout: NavigationItemLayout.bottom,
            ),
            BrutalNavigationItem(
              icon: Icons.person_outline,
              label: 'PROFILE',
              isSelected: currentIndex == 3,
              onTap: () => onItemSelected(3),
              layout: NavigationItemLayout.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
