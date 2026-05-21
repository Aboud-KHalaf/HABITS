import 'package:flutter/material.dart';
import '../design_system/app_colors.dart';
import '../design_system/app_dimensions.dart';
import '../design_system/app_borders.dart';

/// The standard Scaffold layout for Desktop and Web sizes.
/// Intelligently uses additional space (persistent navigation + wide content + side panels).
class DesktopScaffold extends StatelessWidget {
  final Widget body;
  final Widget? leftNavigation;
  final Widget? rightPanel;

  const DesktopScaffold({
    super.key,
    required this.body,
    this.leftNavigation,
    this.rightPanel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Row(
          children: [
            if (leftNavigation != null) ...[
              SizedBox(
                width: AppDimensions.sidebarWidthDesktop,
                child: leftNavigation!,
              ),
              Container(width: AppBorders.borderWidthThin, color: AppColors.neonYellow),
            ],
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: AppDimensions.contentMaxWidth,
                  ),
                  child: body,
                ),
              ),
            ),
            if (rightPanel != null) ...[
              Container(width: AppBorders.borderWidthThin, color: AppColors.neonYellow),
              SizedBox(
                width: AppDimensions.analyticsPanelWidthDesktop,
                child: rightPanel!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
