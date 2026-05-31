import 'package:flutter/material.dart';
import '../../../../shared/responsive/adaptive_layout.dart';
import 'mobile_calendar_layout.dart';
import 'tablet_calendar_layout.dart';
import 'desktop_calendar_layout.dart';

class AdaptiveCalendarLayout extends StatelessWidget {
  const AdaptiveCalendarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveLayout(
      mobile: MobileCalendarLayout(),
      tablet: TabletCalendarLayout(),
      desktop: DesktopCalendarLayout(),
    );
  }
}
