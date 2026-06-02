abstract class ProfileRepository {
  Future<String> getAgentName();
  Future<String> getThemeMode();
  Future<void> setThemeMode(String themeMode);
  Future<bool> getNotificationsEnabled();
  Future<void> setNotificationsEnabled(bool enabled);
  Future<void> exportData();
  Future<void> resetAllData();
}
