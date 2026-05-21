import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Hard shadows for Neo-Brutalist v2 design
class AppShadows {
  AppShadows._();

  // Shadow configurations from DESIGN.md
  // Level 1: 5px solid hard shadow
  static const BoxShadow level1 = BoxShadow(
    color: AppColors.black,
    offset: Offset(5.0, 5.0),
    blurRadius: 0.0,
    spreadRadius: 0.0,
  );

  // Level 2: 10px solid hard shadow
  static const BoxShadow level2 = BoxShadow(
    color: AppColors.black,
    offset: Offset(10.0, 10.0),
    blurRadius: 0.0,
    spreadRadius: 0.0,
  );

  // Helper method to create customized shadows (e.g., colored neon shadows)
  static BoxShadow customLevel1({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(5.0, 5.0),
      blurRadius: 0.0,
      spreadRadius: 0.0,
    );
  }

  static BoxShadow customLevel2({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(10.0, 10.0),
      blurRadius: 0.0,
      spreadRadius: 0.0,
    );
  }

  // Backward compatibility mappings
  static const BoxShadow brutalDefault = level1;
  static const BoxShadow brutalHover = BoxShadow(
    color: AppColors.neonGreen,
    offset: Offset(5.0, 5.0),
    blurRadius: 0.0,
    spreadRadius: 0.0,
  );
  static const BoxShadow brutalSubtle = BoxShadow(
    color: AppColors.white,
    offset: Offset(3.0, 3.0),
    blurRadius: 0.0,
    spreadRadius: 0.0,
  );

  static const BoxShadow none = BoxShadow(
    color: Colors.transparent,
    offset: Offset.zero,
    blurRadius: 0.0,
    spreadRadius: 0.0,
  );
}
