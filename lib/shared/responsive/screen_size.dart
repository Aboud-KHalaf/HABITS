import 'breakpoints.dart';

/// Defines the possible screen sizes based on breakpoints.
enum ScreenSize {
  mobile,
  tablet,
  desktop,
  largeDesktop;

  /// Returns the current [ScreenSize] based on the window's max width.
  static ScreenSize fromWidth(double width) {
    if (width <= Breakpoints.mobileMax) {
      return ScreenSize.mobile;
    } else if (width <= Breakpoints.tabletMax) {
      return ScreenSize.tablet;
    } else if (width <= Breakpoints.desktopMax) {
      return ScreenSize.desktop;
    } else {
      return ScreenSize.largeDesktop;
    }
  }

  bool get isMobile => this == ScreenSize.mobile;
  bool get isTablet => this == ScreenSize.tablet;
  bool get isDesktop => this == ScreenSize.desktop || this == ScreenSize.largeDesktop;
  bool get isLargeDesktop => this == ScreenSize.largeDesktop;
}
