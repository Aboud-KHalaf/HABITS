import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Typography system using Space Grotesk for Neo-Brutalist v2
class AppTypography {
  AppTypography._();

  static const String fontFamily = 'SpaceGrotesk';

  static const TextStyle headlineXl = TextStyle(
    fontFamily: fontFamily,
    fontSize: 48,
    fontWeight: FontWeight.w900, // '900'
    color: AppColors.textPrimary,
    height: 1.0,
    letterSpacing: -1.92, // -0.04em
  );

  static const TextStyle headlineLg = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w900, // '900'
    color: AppColors.textPrimary,
    height: 1.1,
    letterSpacing: -0.64, // -0.02em
  );

  static const TextStyle headlineMd = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w900, // '900'
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: 0.0, // 0em
  );

  static const TextStyle bodyLg = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w700, // '700'
    color: AppColors.textPrimary,
    height: 1.5,
    letterSpacing: 0.0, // 0em
  );

  static const TextStyle bodyMd = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w700, // '700'
    color: AppColors.textPrimary,
    height: 1.5,
    letterSpacing: 0.0, // 0em
  );

  static const TextStyle labelMono = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w900, // '900'
    color: AppColors.textSecondary,
    height: 1.2,
    letterSpacing: 1.4, // 0.1em
  );

  static const TextStyle dataDisplay = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w900, // '900'
    color: AppColors.textPrimary,
    height: 1.0,
    letterSpacing: -0.2, // -0.01em
  );

  // Backward compatibility alias definitions
  static const TextStyle heading1 = headlineXl;
  static const TextStyle heading2 = headlineLg;
  static const TextStyle heading3 = headlineMd;
  static const TextStyle bodyLarge = bodyLg;
  static const TextStyle bodyMedium = bodyMd;
  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.5,
  );
  static const TextStyle label = labelMono;
  static const TextStyle monospaceMetric = dataDisplay;
}
