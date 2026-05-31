import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/navigation/app_shell.dart';
import '../../features/habits/presentation/pages/dashboard_page.dart';
import '../../features/calendar/presentation/pages/calendar_page.dart';
import '../../features/habits/presentation/pages/create_habit_page.dart';

final routerProvider = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const DashboardPage(),
        ),
        GoRoute(
          path: '/calendar',
          builder: (context, state) => const CalendarPage(),
        ),
        GoRoute(
          path: '/analytics',
          builder: (context, state) => const Scaffold(
            backgroundColor: Color(0xFF131313),
            body: Center(
              child: Text(
                'Analytics',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const Scaffold(
            backgroundColor: Color(0xFF131313),
            body: Center(
              child: Text(
                'Profile',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/create-habit',
      builder: (context, state) => const CreateHabitPage(),
    ),
  ],
);
