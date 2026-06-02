import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource _localDataSource;

  ProfileRepositoryImpl(this._localDataSource);

  @override
  Future<String> getAgentName() async {
    return await _localDataSource.getAgentName();
  }

  @override
  Future<String> getThemeMode() async {
    return await _localDataSource.getThemeMode();
  }

  @override
  Future<void> setThemeMode(String themeMode) async {
    await _localDataSource.setThemeMode(themeMode);
  }

  @override
  Future<bool> getNotificationsEnabled() async {
    return await _localDataSource.getNotificationsEnabled();
  }

  @override
  Future<void> setNotificationsEnabled(bool enabled) async {
    await _localDataSource.setNotificationsEnabled(enabled);
  }

  @override
  Future<void> exportData() async {
    await _localDataSource.exportData();
  }

  @override
  Future<void> resetAllData() async {
    await _localDataSource.resetAllData();
  }
}
