import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Neo-Brutalist v2 borders
class AppBorders {
  AppBorders._();

  // Strict orthogonal shapes (zero rounded corners, 90-degree angles only)
  static const Radius radiusSharp = Radius.circular(0.0);
  static final BorderRadius borderSharp = BorderRadius.all(radiusSharp);

  // Border widths from DESIGN.md
  static const double borderWidthThin = 3.0;
  static const double borderWidthThick = 6.0;

  // Backward compatibility support (mapped to spec values)
  static const double widthThick = borderWidthThick;
  static const double widthMedium = borderWidthThin;

  static const Radius radiusSlight = radiusSharp;
  static final BorderRadius borderSlight = borderSharp;

  static final Border outlineThick = Border.all(
    color: AppColors.border,
    width: borderWidthThick,
  );

  static final Border outlineMedium = Border.all(
    color: AppColors.border,
    width: borderWidthThin,
  );
  
  static final Border outlineSubtle = Border.all(
    color: AppColors.borderSubtle,
    width: borderWidthThin,
  );
}
