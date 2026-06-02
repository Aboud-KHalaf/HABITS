import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/profile_providers.dart';
import '../states/profile_state.dart';

class ProfileViewModel extends AutoDisposeNotifier<ProfileState> {
  @override
  ProfileState build() {
    _loadSettings();
    return const ProfileState();
  }

  Future<void> _loadSettings() async {
    try {
      final agentName = await ref.read(getAgentNameUseCaseProvider).call();
      final themeMode = await ref.read(getThemeModeUseCaseProvider).call();
      final notifications =
          await ref.read(getNotificationsEnabledUseCaseProvider).call();
      state = state.copyWith(
        agentName: agentName,
        themeMode: themeMode,
        notificationsEnabled: notifications,
      );
    } catch (_) {
      // Swallowed UnimplementedError so default state remains active in UI
    }
  }

  Future<void> updateThemeMode(String mode) async {
    final previousTheme = state.themeMode;
    state = state.copyWith(themeMode: mode);
    try {
      await ref.read(setThemeModeUseCaseProvider).call(mode);
    } catch (e) {
      state = state.copyWith(
        themeMode: previousTheme,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> toggleNotifications() async {
    final newStatus = !state.notificationsEnabled;
    state = state.copyWith(notificationsEnabled: newStatus);
    try {
      await ref.read(setNotificationsEnabledUseCaseProvider).call(newStatus);
    } catch (e) {
      state = state.copyWith(
        notificationsEnabled: !newStatus,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> exportData() async {
    state = state.copyWith(isExporting: true);
    try {
      await ref.read(exportDataUseCaseProvider).call();
      state = state.copyWith(isExporting: false);
    } catch (e) {
      state = state.copyWith(
        isExporting: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> resetAllData() async {
    state = state.copyWith(isResetting: true);
    try {
      await ref.read(resetAllDataUseCaseProvider).call();
      state = state.copyWith(isResetting: false);
    } catch (e) {
      state = state.copyWith(
        isResetting: false,
        errorMessage: e.toString(),
      );
    }
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}

final profileViewModelProvider =
    NotifierProvider.autoDispose<ProfileViewModel, ProfileState>(() {
  return ProfileViewModel();
});
