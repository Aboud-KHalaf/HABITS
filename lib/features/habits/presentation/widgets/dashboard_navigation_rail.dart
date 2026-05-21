import 'package:flutter/material.dart';
import '../../../../shared/widgets/brutal_navigation_item.dart';
import '../../../../shared/design_system/app_typography.dart';

class DashboardNavigationRail extends StatelessWidget {
  const DashboardNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 64,
          child: Center(
            child: Text(
              'HABITS',
              style: TextStyle(
                fontFamily: AppTypography.fontFamily,
                fontWeight: FontWeight.w900,
                fontSize: 24,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ),
        BrutalNavigationItem(
          icon: Icons.dashboard,
          label: 'Dashboard',
          isSelected: true,
          onTap: () {},
        ),
        BrutalNavigationItem(
          icon: Icons.calendar_month,
          label: 'History',
          isSelected: false,
          onTap: () {},
        ),
        BrutalNavigationItem(
          icon: Icons.bar_chart,
          label: 'Analytics',
          isSelected: false,
          onTap: () {},
        ),
        const Spacer(),
        BrutalNavigationItem(
          icon: Icons.settings,
          label: 'Settings',
          isSelected: false,
          onTap: () {},
        ),
      ],
    );
  }
}
