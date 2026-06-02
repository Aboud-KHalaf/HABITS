import '../repositories/profile_repository.dart';

class GetNotificationsEnabled {
  final ProfileRepository repository;

  GetNotificationsEnabled(this.repository);

  Future<bool> call() async {
    return await repository.getNotificationsEnabled();
  }
}
