import 'package:flutter/material.dart';
import '../design_system/app_borders.dart';
import '../design_system/app_colors.dart';
import '../design_system/app_shadows.dart';
import '../design_system/app_spacing.dart';

/// A Neo-Brutalist card container.
class BrutalCard extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;

  const BrutalCard({
    super.key,
    required this.child,
    this.backgroundColor = AppColors.surface,
    this.padding = const EdgeInsets.all(AppSpacing.md),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: AppBorders.outlineThick,
        boxShadow: const [AppShadows.brutalSubtle],
      ),
      child: child,
    );
  }
}
