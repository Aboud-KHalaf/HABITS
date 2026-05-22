import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';

class CreateHabitNameInput extends StatelessWidget {
  final TextEditingController controller;

  const CreateHabitNameInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1. HABIT NAME',
          style: AppTypography.labelMono.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          style: AppTypography.bodyLg.copyWith(color: AppColors.white),
          decoration: InputDecoration(
            hintText: 'E.g. Drink Water',
            hintStyle: AppTypography.bodyLg.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.onSurfaceVariant,
                width: 2,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.neonYellow, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
