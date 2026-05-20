import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  AppTypography._();

  static TextTheme get textTheme => TextTheme(
        headlineLarge: GoogleFonts.spaceGrotesk(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          height: 1.1,
          letterSpacing: -0.02,
          color: AppColors.onSurface,
        ),
        headlineMedium: GoogleFonts.spaceGrotesk(
          fontSize: 24,
          fontWeight: FontWeight.w900,
          height: 1.2,
          letterSpacing: 0,
          color: AppColors.onSurface,
        ),
        headlineSmall: GoogleFonts.spaceGrotesk(
          fontSize: 48,
          fontWeight: FontWeight.w900,
          height: 1.0,
          letterSpacing: -0.04,
          color: AppColors.onSurface,
        ),
        displayLarge: GoogleFonts.spaceGrotesk(
          fontSize: 48,
          fontWeight: FontWeight.w900,
          height: 1.0,
          letterSpacing: -0.04,
          color: AppColors.onSurface,
        ),
        displayMedium: GoogleFonts.spaceGrotesk(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          height: 1.1,
          letterSpacing: -0.02,
          color: AppColors.onSurface,
        ),
        displaySmall: GoogleFonts.spaceGrotesk(
          fontSize: 24,
          fontWeight: FontWeight.w900,
          height: 1.2,
          letterSpacing: 0,
          color: AppColors.onSurface,
        ),
        bodyLarge: GoogleFonts.spaceGrotesk(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          height: 1.5,
          letterSpacing: 0,
          color: AppColors.onSurface,
        ),
        bodyMedium: GoogleFonts.spaceGrotesk(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 1.5,
          letterSpacing: 0,
          color: AppColors.onSurface,
        ),
        bodySmall: GoogleFonts.spaceGrotesk(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          height: 1.5,
          letterSpacing: 0,
          color: AppColors.onSurface,
        ),
        labelLarge: GoogleFonts.spaceGrotesk(
          fontSize: 14,
          fontWeight: FontWeight.w900,
          height: 1.2,
          letterSpacing: 0.1,
          color: AppColors.onSurface,
        ),
        labelMedium: GoogleFonts.spaceGrotesk(
          fontSize: 14,
          fontWeight: FontWeight.w900,
          height: 1.2,
          letterSpacing: 0.1,
          color: AppColors.onSurface,
        ),
        labelSmall: GoogleFonts.spaceGrotesk(
          fontSize: 14,
          fontWeight: FontWeight.w900,
          height: 1.2,
          letterSpacing: 0.1,
          color: AppColors.onSurface,
        ),
      );
}