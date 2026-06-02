abstract class ProfileLocalDataSource {
  Future<String> getAgentName();
  Future<String> getThemeMode();
  Future<void> setThemeMode(String themeMode);
  Future<bool> getNotificationsEnabled();
  Future<void> setNotificationsEnabled(bool enabled);
  Future<void> exportData();
  Future<void> resetAllData();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  @override
  Future<String> getAgentName() async {
    throw UnimplementedError('getAgentName() has not been implemented.');
  }

  @override
  Future<String> getThemeMode() async {
    throw UnimplementedError('getThemeMode() has not been implemented.');
  }

  @override
  Future<void> setThemeMode(String themeMode) async {
    throw UnimplementedError('setThemeMode() has not been implemented.');
  }

  @override
  Future<bool> getNotificationsEnabled() async {
    throw UnimplementedError(
        'getNotificationsEnabled() has not been implemented.');
  }

  @override
  Future<void> setNotificationsEnabled(bool enabled) async {
    throw UnimplementedError(
        'setNotificationsEnabled() has not been implemented.');
  }

  @override
  Future<void> exportData() async {
    throw UnimplementedError('exportData() has not been implemented.');
  }

  @override
  Future<void> resetAllData() async {
    throw UnimplementedError('resetAllData() has not been implemented.');
  }
}
