import 'package:flutter/material.dart';
import '../../../../shared/responsive/adaptive_layout.dart';
import '../layouts/mobile_calendar_layout.dart';
import '../layouts/tablet_calendar_layout.dart';
import '../layouts/desktop_calendar_layout.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveLayout(
      mobile: MobileCalendarLayout(),
      tablet: TabletCalendarLayout(),
      desktop: DesktopCalendarLayout(),
    );
  }
}
