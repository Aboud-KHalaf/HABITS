import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared/navigation/app_shell.dart';
import '../../features/habits/presentation/pages/dashboard_page.dart';
import '../../features/calendar/presentation/pages/calendar_page.dart';
import '../../features/habits/presentation/pages/create_habit_page.dart';
import '../../features/analytics/presentation/pages/analytics_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/auth/presentation/viewmodels/auth_viewmodel.dart';

// We use a simple listenable class to notify GoRouter when authentication state changes
class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen(
      authViewModelProvider,
      (previous, next) {
        notifyListeners();
      },
    );
  }
}

final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: notifier,
    redirect: (context, state) {
      final authState = ref.read(authViewModelProvider);
      final user = authState.valueOrNull;

      final isLoggingIn = state.matchedLocation == '/sign-in' ||
          state.matchedLocation == '/sign-up';

      // If user is not authenticated and is trying to access protected route, redirect to sign-in
      if (user == null) {
        return isLoggingIn ? null : '/sign-in';
      }

      // If user is authenticated and trying to access login/signup, redirect to home
      if (isLoggingIn) {
        return '/';
      }

      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(path: '/', builder: (context, state) => const DashboardPage()),
          GoRoute(
            path: '/calendar',
            builder: (context, state) => const CalendarPage(),
          ),
          GoRoute(
            path: '/analytics',
            builder: (context, state) => const AnalyticsPage(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
      GoRoute(
        path: '/create-habit',
        builder: (context, state) => const CreateHabitPage(),
      ),
      GoRoute(
        path: '/sign-in',
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: '/sign-up',
        builder: (context, state) => const SignUpPage(),
      ),
    ],
  );
});
