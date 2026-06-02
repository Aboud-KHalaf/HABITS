import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/widgets/brutal_card.dart';

class ProfileActiveAgentCard extends StatelessWidget {
  final String agentName;

  const ProfileActiveAgentCard({
    super.key,
    required this.agentName,
  });

  @override
  Widget build(BuildContext context) {
    return BrutalCard(
      backgroundColor: AppColors.surfaceContainerLow,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.black,
              border: Border.all(
                color: AppColors.primaryContainer, // Cyan/blue
                width: 2.0,
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.person_outline,
                color: AppColors.white,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ACTIVE AGENT',
                style: AppTypography.labelMono.copyWith(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                agentName,
                style: AppTypography.bodyLg.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
