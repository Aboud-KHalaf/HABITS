import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'app_spacing.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      primary: AppColors.primaryContainer,
      onPrimary: AppColors.onPrimaryContainer,
      secondary: AppColors.secondaryContainer,
      onSecondary: AppColors.onSecondaryContainer,
      tertiary: AppColors.tertiaryContainer,
      onTertiary: AppColors.onTertiaryContainer,
      error: AppColors.error,
      onError: AppColors.onError,
      surfaceContainerHighest: AppColors.surfaceContainerHighest,
    ),
    scaffoldBackgroundColor: AppColors.background,
    textTheme: AppTypography.textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceContainerLowest,
      foregroundColor: AppColors.onSurface,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: AppTypography.textTheme.headlineMedium,
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceContainerLow,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: const BorderSide(
          color: AppColors.onSurface,
          width: AppSpacing.borderWidthThin,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryContainer,
        foregroundColor: AppColors.onPrimaryContainer,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: const BorderSide(
            color: AppColors.surface,
            width: AppSpacing.borderWidthThin,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        textStyle: AppTypography.textTheme.labelLarge?.copyWith(
          letterSpacing: 0.1,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.onSurface,
        side: const BorderSide(
          color: AppColors.onSurface,
          width: AppSpacing.borderWidthThin,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: const BorderSide(
          color: AppColors.onSurface,
          width: AppSpacing.borderWidthThin,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: const BorderSide(
          color: AppColors.onSurface,
          width: AppSpacing.borderWidthThin,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: const BorderSide(
          color: AppColors.primaryContainer,
          width: AppSpacing.borderWidthThick,
        ),
      ),
      labelStyle: AppTypography.textTheme.bodyMedium,
      hintStyle: AppTypography.textTheme.bodyMedium?.copyWith(
        color: AppColors.onSurfaceVariant,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.secondaryContainer;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(AppColors.onSecondaryContainer),
      side: const BorderSide(
        color: AppColors.onSurface,
        width: AppSpacing.borderWidthThin,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.secondaryContainer,
      linearTrackColor: AppColors.surfaceContainerHighest,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.outlineVariant,
      thickness: AppSpacing.borderWidthThin,
      space: AppSpacing.md,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfaceContainerLowest,
      selectedItemColor: AppColors.primaryContainer,
      unselectedItemColor: AppColors.onSurfaceVariant,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surfaceContainerLowest,
      indicatorColor: AppColors.primaryContainer,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppTypography.textTheme.labelMedium?.copyWith(
            color: AppColors.onPrimaryContainer,
          );
        }
        return AppTypography.textTheme.labelMedium?.copyWith(
          color: AppColors.onSurfaceVariant,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppColors.onPrimaryContainer);
        }
        return const IconThemeData(color: AppColors.onSurfaceVariant);
      }),
    ),
    iconTheme: const IconThemeData(color: AppColors.onSurface, size: 24),
    dialogTheme: const DialogThemeData(
      backgroundColor: AppColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(
          color: AppColors.onSurface,
          width: AppSpacing.borderWidthThin,
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.surface,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(
          color: AppColors.onSurface,
          width: AppSpacing.borderWidthThin,
        ),
      ),
      headerBackgroundColor: AppColors.surfaceContainerLow,
      headerForegroundColor: AppColors.onSurface,
      dayShape: WidgetStateProperty.all(
        const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.secondaryContainer; // Electric Green
        }
        return null;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.surface;
        }
        return null;
      }),
      todayBackgroundColor: WidgetStateProperty.all(Colors.transparent),
      todayForegroundColor: WidgetStateProperty.all(
        AppColors.primaryContainer,
      ), // Neon Yellow
      todayBorder: const BorderSide(
        color: AppColors.primaryContainer,
        width: 1.5,
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(
          color: AppColors.onSurface,
          width: AppSpacing.borderWidthThin,
        ),
      ),
      hourMinuteShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(
          color: AppColors.outline,
          width: AppSpacing.borderWidthThin,
        ),
      ),
      hourMinuteColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryContainer; // Neon Yellow
        }
        return AppColors.surfaceContainerLow;
      }),
      hourMinuteTextColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.surface;
        }
        return AppColors.onSurface;
      }),
      dialBackgroundColor: AppColors.surfaceContainerLow,
      dialHandColor: AppColors.primaryContainer,
      dialTextColor: AppColors.onSurface,
      entryModeIconColor: AppColors.onSurface,
    ),
  );
}

extension AppThemeExtensions on ThemeData {
  Color get neoSurface => AppColors.surface;
  Color get neoPrimary => AppColors.primaryContainer;
  Color get neoSecondary => AppColors.secondaryContainer;
  Color get neoTertiary => AppColors.tertiaryContainer;
  Color get neoError => AppColors.error;

  double get borderThin => AppSpacing.borderWidthThin;
  double get borderThick => AppSpacing.borderWidthThick;
}
