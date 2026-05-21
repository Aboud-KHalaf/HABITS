import 'package:flutter/material.dart';

/// Centralized spacing system for Neo-Brutalist v2
class AppSpacing {
  AppSpacing._();

  // Spacing values from DESIGN.md
  static const double unit = 4.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double gutter = 16.0;
  static const double margin = 20.0;
  static const double borderWidthThin = 3.0;
  static const double borderWidthThick = 6.0;

  // Backward compatibility alias definitions
  static const double xxs = 4.0;
  static const double xxl = 48.0;
  static const double max = 64.0;

  // Vertical Gaps
  static const Widget gapUnit = SizedBox(height: unit);
  static const Widget gapXS = SizedBox(height: xs);
  static const Widget gapSM = SizedBox(height: sm);
  static const Widget gapMD = SizedBox(height: md);
  static const Widget gapLG = SizedBox(height: lg);
  static const Widget gapXL = SizedBox(height: xl);
  static const Widget gapXXL = SizedBox(height: xxl);
  static const Widget gapGutter = SizedBox(height: gutter);
  static const Widget gapMargin = SizedBox(height: margin);

  // Horizontal Gaps
  static const Widget gapWUnit = SizedBox(width: unit);
  static const Widget gapWXS = SizedBox(width: xs);
  static const Widget gapWSM = SizedBox(width: sm);
  static const Widget gapWMD = SizedBox(width: md);
  static const Widget gapWLG = SizedBox(width: lg);
  static const Widget gapWXL = SizedBox(width: xl);
  static const Widget gapWXXL = SizedBox(width: xxl);
  static const Widget gapWGutter = SizedBox(width: gutter);
  static const Widget gapWMargin = SizedBox(width: margin);
}
