import 'package:flutter/material.dart';
import 'mobile_calendar_layout.dart';

class TabletCalendarLayout extends StatelessWidget {
  const TabletCalendarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: const MobileCalendarLayout(),
      ),
    );
  }
}
