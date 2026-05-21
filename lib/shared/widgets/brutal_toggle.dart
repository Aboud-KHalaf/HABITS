import 'package:flutter/material.dart';
import '../design_system/app_borders.dart';
import '../design_system/app_colors.dart';

/// A Neo-Brutalist toggle switch or checkbox alternative.
class BrutalToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const BrutalToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 60,
        height: 32,
        decoration: BoxDecoration(
          color: AppColors.background,
          border: AppBorders.outlineThick,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: value ? 28 : 0,
              top: 0,
              bottom: 0,
              width: 24,
              child: Container(
                decoration: BoxDecoration(
                  color: value ? AppColors.neonGreen : AppColors.borderSubtle,
                  border: AppBorders.outlineMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
