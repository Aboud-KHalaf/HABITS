import '../repositories/profile_repository.dart';

class GetThemeMode {
  final ProfileRepository repository;

  GetThemeMode(this.repository);

  Future<String> call() async {
    return await repository.getThemeMode();
  }
}
