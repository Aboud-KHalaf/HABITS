import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_borders.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_shadows.dart';
import '../../../../shared/design_system/app_typography.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText.toUpperCase(),
          style: AppTypography.labelMono.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: const BoxDecoration(
            boxShadow: [AppShadows.level1],
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            style: AppTypography.bodyLg.copyWith(
              color: AppColors.white,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.surfaceContainerHigh,
              hintText: hintText,
              hintStyle: AppTypography.bodyLg.copyWith(
                color: AppColors.textSecondary,
              ),
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(
                  color: AppColors.white,
                  width: AppBorders.borderWidthThin,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(
                  color: AppColors.neonYellow,
                  width: AppBorders.borderWidthThin,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(
                  color: AppColors.error,
                  width: AppBorders.borderWidthThin,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(
                  color: AppColors.error,
                  width: AppBorders.borderWidthThin,
                ),
              ),
              errorStyle: AppTypography.bodySmall.copyWith(
                color: AppColors.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
