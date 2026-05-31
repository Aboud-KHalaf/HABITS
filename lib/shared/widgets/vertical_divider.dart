import 'package:flutter/material.dart';
import 'package:habits/shared/design_system/app_borders.dart';

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      width: AppBorders.borderWidthThin,
      color: Theme.of(context).colorScheme.outlineVariant,
    );
  }
}
