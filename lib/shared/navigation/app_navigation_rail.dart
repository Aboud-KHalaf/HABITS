import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../design_system/app_colors.dart';
import '../design_system/app_typography.dart';
import '../design_system/app_spacing.dart';
import 'app_tab.dart';

class AppNavigationRail extends StatelessWidget {
  final AppTab currentTab;

  const AppNavigationRail({super.key, required this.currentTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.xl,
            ),
            child: Text(
              'HABITS',
              style: AppTypography.headlineLg,
              textAlign: TextAlign.center,
            ),
          ),
          ...AppTab.values.map(
            (tab) => _RailItem(
              tab: tab,
              isSelected: tab == currentTab,
              onTap: () => context.go(tab.route),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _RailItem extends StatelessWidget {
  final AppTab tab;
  final bool isSelected;
  final VoidCallback onTap;

  const _RailItem({
    required this.tab,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          border: isSelected
              ? const Border(
                  left: BorderSide(color: AppColors.neonYellow, width: 3),
                )
              : null,
          color: isSelected ? AppColors.surfaceContainerHigh : null,
        ),
        child: Row(
          children: [
            Icon(
              tab.icon,
              color: isSelected
                  ? AppColors.neonYellow
                  : AppColors.textSecondary,
              size: 24,
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              tab.label,
              style: AppTypography.bodyMd.copyWith(
                color: isSelected
                    ? AppColors.neonYellow
                    : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
