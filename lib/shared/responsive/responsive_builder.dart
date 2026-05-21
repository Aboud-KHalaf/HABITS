import 'package:flutter/material.dart';
import 'screen_size.dart';

/// A utility widget that provides the current [ScreenSize] to its builder.
/// This prevents hardcoding MediaQuery logic across the application.
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ScreenSize screenSize, BoxConstraints constraints) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use constraints.maxWidth as per SKILL.md rules to adapt to the allocated window space
        final screenSize = ScreenSize.fromWidth(constraints.maxWidth);
        return builder(context, screenSize, constraints);
      },
    );
  }
}
