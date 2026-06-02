import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/widgets/brutal_card.dart';

class ProfileExportTile extends StatelessWidget {
  final VoidCallback onTap;
  final bool isExporting;

  const ProfileExportTile({
    super.key,
    required this.onTap,
    this.isExporting = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isExporting ? null : onTap,
      child: BrutalCard(
        backgroundColor: AppColors.surfaceContainerLow,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'EXPORT DATA',
              style: AppTypography.bodyLg.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
            if (isExporting)
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  color: AppColors.white,
                ),
              )
            else
              const Icon(
                Icons.upload_rounded,
                color: AppColors.white,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
