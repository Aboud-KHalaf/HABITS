class ProfileState {
  final String agentName;
  final String themeMode;
  final bool notificationsEnabled;
  final bool isExporting;
  final bool isResetting;
  final String? errorMessage;

  const ProfileState({
    this.agentName = 'USER_#8842',
    this.themeMode = 'dark',
    this.notificationsEnabled = true,
    this.isExporting = false,
    this.isResetting = false,
    this.errorMessage,
  });

  ProfileState copyWith({
    String? agentName,
    String? themeMode,
    bool? notificationsEnabled,
    bool? isExporting,
    bool? isResetting,
    String? errorMessage,
  }) {
    return ProfileState(
      agentName: agentName ?? this.agentName,
      themeMode: themeMode ?? this.themeMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      isExporting: isExporting ?? this.isExporting,
      isResetting: isResetting ?? this.isResetting,
      errorMessage: errorMessage,
    );
  }
}
