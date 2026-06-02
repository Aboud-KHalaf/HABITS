import '../repositories/profile_repository.dart';

class SetNotificationsEnabled {
  final ProfileRepository repository;

  SetNotificationsEnabled(this.repository);

  Future<void> call(bool enabled) async {
    await repository.setNotificationsEnabled(enabled);
  }
}
