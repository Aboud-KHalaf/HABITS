import 'package:flutter/material.dart';
import 'responsive_builder.dart';

/// Conditionally renders layouts based on the current screen size.
/// Provide specific layouts for mobile, tablet, and desktop.
/// If tablet or desktop is missing, it falls back to the smaller available layout.
class AdaptiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const AdaptiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        if (screenSize.isDesktop && desktop != null) {
          return desktop!;
        } else if ((screenSize.isTablet || screenSize.isDesktop) && tablet != null) {
          return tablet!;
        }
        return mobile;
      },
    );
  }
}
