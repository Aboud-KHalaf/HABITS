import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/profile_local_datasource.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/export_data.dart';
import '../../domain/usecases/get_agent_name.dart';
import '../../domain/usecases/get_notifications_enabled.dart';
import '../../domain/usecases/get_theme_mode.dart';
import '../../domain/usecases/reset_all_data.dart';
import '../../domain/usecases/set_notifications_enabled.dart';
import '../../domain/usecases/set_theme_mode.dart';

final profileLocalDataSourceProvider = Provider<ProfileLocalDataSource>((ref) {
  return ProfileLocalDataSourceImpl();
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final dataSource = ref.watch(profileLocalDataSourceProvider);
  return ProfileRepositoryImpl(dataSource);
});

final getAgentNameUseCaseProvider = Provider<GetAgentName>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return GetAgentName(repository);
});

final getThemeModeUseCaseProvider = Provider<GetThemeMode>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return GetThemeMode(repository);
});

final setThemeModeUseCaseProvider = Provider<SetThemeMode>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return SetThemeMode(repository);
});

final getNotificationsEnabledUseCaseProvider =
    Provider<GetNotificationsEnabled>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return GetNotificationsEnabled(repository);
});

final setNotificationsEnabledUseCaseProvider =
    Provider<SetNotificationsEnabled>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return SetNotificationsEnabled(repository);
});

final exportDataUseCaseProvider = Provider<ExportData>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return ExportData(repository);
});

final resetAllDataUseCaseProvider = Provider<ResetAllData>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return ResetAllData(repository);
});
