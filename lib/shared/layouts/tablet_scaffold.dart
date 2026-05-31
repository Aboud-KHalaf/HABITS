import 'package:flutter/material.dart';
import 'package:habits/shared/widgets/add_habit_fab.dart';
import 'package:habits/shared/widgets/vertical_divider.dart';
import '../design_system/app_colors.dart';
import '../design_system/app_dimensions.dart';
import '../design_system/app_borders.dart';

/// The standard Scaffold layout for Tablet sizes.
/// Often uses a two-column layout (content + side panel) or side navigation rail.
class TabletScaffold extends StatelessWidget {
  final Widget body;
  final Widget? sidePanel; // e.g., analytics or quick actions
  final Widget? navigationRail;

  const TabletScaffold({
    super.key,
    required this.body,
    this.sidePanel,
    this.navigationRail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: AddHabitFab(),
      body: SafeArea(
        child: Row(
          children: [
            if (navigationRail != null) ...[
              SizedBox(
                width: AppDimensions.sidebarWidthDesktop,
                child: navigationRail!,
              ),
              VerticalDividerWidget(),
            ],
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
