import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Hard shadows for Neo-Brutalist design
class AppShadows {
  AppShadows._();

  static const BoxShadow brutalDefault = BoxShadow(
    color: AppColors.electricBlue,
    offset: Offset(4.0, 4.0),
    blurRadius: 0.0,
    spreadRadius: 0.0,
  );

  static const BoxShadow brutalHover = BoxShadow(
    color: AppColors.neonGreen,
    offset: Offset(6.0, 6.0),
    blurRadius: 0.0,
    spreadRadius: 0.0,
  );

  static const BoxShadow brutalSubtle = BoxShadow(
    color: AppColors.border,
    offset: Offset(2.0, 2.0),
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
