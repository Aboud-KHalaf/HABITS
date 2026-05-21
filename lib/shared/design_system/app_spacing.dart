import 'package:flutter/material.dart';

/// Centralized spacing system
class AppSpacing {
  AppSpacing._();

  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double max = 64.0;

  // Vertical Gaps
  static const Widget gapXXS = SizedBox(height: xxs);
  static const Widget gapXS = SizedBox(height: xs);
  static const Widget gapSM = SizedBox(height: sm);
  static const Widget gapMD = SizedBox(height: md);
  static const Widget gapLG = SizedBox(height: lg);
  static const Widget gapXL = SizedBox(height: xl);
  static const Widget gapXXL = SizedBox(height: xxl);

  // Horizontal Gaps
  static const Widget gapWXXS = SizedBox(width: xxs);
  static const Widget gapWXS = SizedBox(width: xs);
  static const Widget gapWSM = SizedBox(width: sm);
  static const Widget gapWMD = SizedBox(width: md);
  static const Widget gapWLG = SizedBox(width: lg);
  static const Widget gapWXL = SizedBox(width: xl);
  static const Widget gapWXXL = SizedBox(width: xxl);
}
