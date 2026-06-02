import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/widgets/brutal_card.dart';

class ProfileAppearanceTile extends StatelessWidget {
  final String currentMode;
  final ValueChanged<String> onModeChanged;

  const ProfileAppearanceTile({
    super.key,
    required this.currentMode,
    required this.onModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = currentMode.toLowerCase() == 'dark';

    return BrutalCard(
      backgroundColor: AppColors.surfaceContainerLow,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'APPEARANCE',
            style: AppTypography.bodyLg.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.outlineVariant,
                width: 2.0,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildToggleButton(
                  text: 'LIGHT',
                  isSelected: !isDark,
                  onTap: () => onModeChanged('light'),
                ),
                Container(
                  width: 2.0,
                  height: 32,
                  color: AppColors.outlineVariant,
                ),
                _buildToggleButton(
                  text: 'DARK',
                  isSelected: isDark,
                  onTap: () => onModeChanged('dark'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: isSelected ? AppColors.primaryContainer : AppColors.black,
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppTypography.labelMono.copyWith(
            color: isSelected ? AppColors.black : AppColors.white,
            fontWeight: FontWeight.w900,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
