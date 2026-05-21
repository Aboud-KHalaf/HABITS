import 'package:flutter/material.dart';
import '../responsive/adaptive_layout.dart';
import 'mobile_scaffold.dart';
import 'tablet_scaffold.dart';
import 'desktop_scaffold.dart';

/// A unified Scaffold that automatically adapts to the current screen size
/// by utilizing [AdaptiveLayout] and the specific responsive scaffolds.
class AdaptiveScaffold extends StatelessWidget {
  // Common components
  final Widget body;
  
  // Mobile specific
  final PreferredSizeWidget? mobileAppBar;
  final Widget? mobileBottomNavigation;
  final Widget? mobileFloatingActionButton;

  // Tablet & Desktop specific
  final Widget? tabletSidePanel;
  final Widget? tabletNavigationRail;
  
  final Widget? desktopLeftNavigation;
  final Widget? desktopRightPanel;

  const AdaptiveScaffold({
    super.key,
    required this.body,
    this.mobileAppBar,
    this.mobileBottomNavigation,
    this.mobileFloatingActionButton,
    this.tabletSidePanel,
    this.tabletNavigationRail,
    this.desktopLeftNavigation,
    this.desktopRightPanel,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: MobileScaffold(
        appBar: mobileAppBar,
        body: body,
        bottomNavigationBar: mobileBottomNavigation,
        floatingActionButton: mobileFloatingActionButton,
      ),
      tablet: TabletScaffold(
        body: body,
        navigationRail: tabletNavigationRail,
        sidePanel: tabletSidePanel,
      ),
      desktop: DesktopScaffold(
        body: body,
        leftNavigation: desktopLeftNavigation,
        rightPanel: desktopRightPanel,
      ),
    );
  }
}
