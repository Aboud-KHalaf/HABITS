import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Neo-Brutalist borders
class AppBorders {
  AppBorders._();

  static const double widthThick = 4.0;
  static const double widthMedium = 2.0;

  static const Radius radiusSharp = Radius.circular(0.0);
  static const Radius radiusSlight = Radius.circular(4.0);

  static final BorderRadius borderSharp = BorderRadius.all(radiusSharp);
  static final BorderRadius borderSlight = BorderRadius.all(radiusSlight);

  static final Border outlineThick = Border.all(
    color: AppColors.border,
    width: widthThick,
  );

  static final Border outlineMedium = Border.all(
    color: AppColors.border,
    width: widthMedium,
  );
  
  static final Border outlineSubtle = Border.all(
    color: AppColors.borderSubtle,
    width: widthMedium,
  );
}
