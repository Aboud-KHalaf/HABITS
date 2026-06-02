import '../repositories/profile_repository.dart';

class SetThemeMode {
  final ProfileRepository repository;

  SetThemeMode(this.repository);

  Future<void> call(String themeMode) async {
    await repository.setThemeMode(themeMode);
  }
}
