import 'package:flutter/material.dart';
import '../design_system/app_spacing.dart';
import '../design_system/app_typography.dart';
import '../design_system/app_borders.dart';

enum NavigationItemLayout { rail, bottom }

/// A reusable navigation item for Rails or Bottom Navigation in Neo-Brutalist style.
class BrutalNavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final NavigationItemLayout layout;

  const BrutalNavigationItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.layout = NavigationItemLayout.rail,
  });

  @override
  Widget build(BuildContext context) {
    if (layout == NavigationItemLayout.bottom) {
      return Expanded(
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              border: isSelected
                  ? Border.all(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: 2.0,
                    )
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: isSelected
                      ? Theme.of(context).colorScheme.surface
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                  size: 22,
                ),
                const SizedBox(height: 2),
                Text(
                  label.toUpperCase(),
                  style: AppTypography.labelMono.copyWith(
                    color: isSelected
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.surfaceContainerHigh
              : Colors.transparent,
          border: isSelected
              ? Border(
                  left: BorderSide(
                    color: Theme.of(context).colorScheme.tertiary,
                    width: AppBorders.borderWidthThin,
                  ),
                )
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            AppSpacing.gapWXS,
            Text(
              label.toUpperCase(),
              style: AppTypography.labelMono.copyWith(
                color: isSelected
                    ? Theme.of(context).colorScheme.onSurface
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
