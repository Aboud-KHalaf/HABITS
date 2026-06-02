import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/router/router.dart';
import 'core/theme/theme.dart';
import 'core/database/hive_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitializer.init();
  runApp(const ProviderScope(child: HabitsApp()));
}

class HabitsApp extends ConsumerWidget {
  const HabitsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'HABITS',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
