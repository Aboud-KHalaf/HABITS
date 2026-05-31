import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../design_system/app_borders.dart';
import '../design_system/app_typography.dart';
import '../design_system/app_colors.dart';
import 'app_tab.dart';

class AppNavigationBar extends StatelessWidget {
  final AppTab currentTab;

  const AppNavigationBar({super.key, required this.currentTab});

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
          children: AppTab.values.map((tab) {
            final isSelected = tab == currentTab;
            return Expanded(
              child: _BarItem(
                tab: tab,
                isSelected: isSelected,
                onTap: () => context.go(tab.route),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _BarItem extends StatelessWidget {
  final AppTab tab;
  final bool isSelected;
  final VoidCallback onTap;

  const _BarItem({
    required this.tab,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? AppColors.neonYellow
        : Theme.of(context).colorScheme.onSurfaceVariant;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: isSelected
            ? BoxDecoration(
                color: color,
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface,
                  width: 2.0,
                ),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(tab.icon, color: isSelected ? AppColors.black : color, size: 22),
            const SizedBox(height: 2),
            Text(
              tab.label.toUpperCase(),
              style: AppTypography.labelMono.copyWith(
                color: isSelected ? AppColors.black : color,
                fontSize: 9,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
