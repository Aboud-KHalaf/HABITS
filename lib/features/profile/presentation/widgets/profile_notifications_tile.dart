import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/widgets/brutal_card.dart';

class ProfileNotificationsTile extends StatelessWidget {
  final bool enabled;
  final ValueChanged<bool> onToggle;

  const ProfileNotificationsTile({
    super.key,
    required this.enabled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return BrutalCard(
      backgroundColor: AppColors.surfaceContainerLow,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'NOTIFICATIONS',
            style: AppTypography.bodyLg.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
          GestureDetector(
            onTap: () => onToggle(!enabled),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: enabled ? AppColors.primaryContainer : AppColors.black,
                border: Border.all(
                  color: enabled ? AppColors.black : AppColors.white,
                  width: 2.0,
                ),
              ),
              child: enabled
                  ? const Icon(
                      Icons.check,
                      color: AppColors.black,
                      size: 20,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
