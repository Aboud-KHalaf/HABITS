import 'package:flutter/material.dart';

/// Neo-Brutalist v2 Color System
class AppColors {
  AppColors._();

  // Brand Palette
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color neonYellow = Color(0xFFFFFF00);
  static const Color electricGreen = Color(0xFF00FF41);
  static const Color shockingPink = Color(0xFFFF00FF);
  static const Color deepRed = Color(0xFF93000A);

  // Material Design 3 Spec Mappings from DESIGN.md
  static const Color surface = Color(0xFF131313);
  static const Color surfaceDim = Color(0xFF131313);
  static const Color surfaceBright = Color(0xFF393939);
  static const Color surfaceContainerLowest = Color(0xFF0E0E0E);
  static const Color surfaceContainerLow = Color(0xFF1C1B1B);
  static const Color surfaceContainer = Color(0xFF201F1F);
  static const Color surfaceContainerHigh = Color(0xFF2A2A2A);
  static const Color surfaceContainerHighest = Color(0xFF353534);

  static const Color onSurface = Color(0xFFE5E2E1);
  static const Color onSurfaceVariant = Color(0xFFBEC7D4);
  static const Color inverseSurface = Color(0xFFE5E2E1);
  static const Color inverseOnSurface = Color(0xFF313030);

  static const Color outline = Color(0xFF88919D);
  static const Color outlineVariant = Color(0xFF3F4852);
  static const Color surfaceTint = Color(0xFF98CBFF);

  static const Color primary = Color(0xFF98CBFF);
  static const Color onPrimary = Color(0xFF003354);
  static const Color primaryContainer = Color(0xFF00A3FF);
  static const Color onPrimaryContainer = Color(0xFF00375A);
  static const Color inversePrimary = Color(0xFF00629D);

  static const Color secondary = Color(0xFFC6C6C7);
  static const Color onSecondary = Color(0xFF2F3131);
  static const Color secondaryContainer = Color(0xFF454747);
  static const Color onSecondaryContainer = Color(0xFFB4B5B5);

  static const Color tertiary = Color(0xFFFFB77D);
  static const Color onTertiary = Color(0xFF4D2600);
  static const Color tertiaryContainer = Color(0xFFEB8104);
  static const Color onTertiaryContainer = Color(0xFF522900);

  static const Color error = Color(0xFFFFB4AB);
  static const Color onError = Color(0xFF690005);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color onErrorContainer = Color(0xFFFFDAD6);

  static const Color primaryFixed = Color(0xFFCFE5FF);
  static const Color primaryFixedDim = Color(0xFF98CBFF);
  static const Color onPrimaryFixed = Color(0xFF001D33);
  static const Color onPrimaryFixedVariant = Color(0xFF004A77);

  static const Color secondaryFixed = Color(0xFFE2E2E2);
  static const Color secondaryFixedDim = Color(0xFFC6C6C7);
  static const Color onSecondaryFixed = Color(0xFF1A1C1C);
  static const Color onSecondaryFixedVariant = Color(0xFF454747);

  static const Color tertiaryFixed = Color(0xFFFFDCC3);
  static const Color tertiaryFixedDim = Color(0xFFFFB77D);
  static const Color onTertiaryFixed = Color(0xFF2F1500);
  static const Color onTertiaryFixedVariant = Color(0xFF6E3900);

  static const Color background = Color(0xFF131313);
  static const Color onBackground = Color(0xFFE5E2E1);
  static const Color surfaceVariant = Color(0xFF353534);

  // Backward compatibility alias colors (mapped to new palette specs)
  static const Color border = white;
  static const Color borderSubtle = outlineVariant;
  static const Color electricBlue =
      neonYellow; // Neo-Brutalist v2 does not use electric blue, map to primary action neonYellow
  static const Color neonGreen = electricGreen;
  static const Color alertRed = deepRed;
  static const Color warningYellow = neonYellow;
  static const Color surfaceElevated = surfaceContainerHigh;
  static const Color textPrimary = onSurface;
  static const Color textSecondary = onSurfaceVariant;
  static const Color textInverse = inverseOnSurface;

  // New Additions
  static const Color transparent = Color(0x00000000);
}
