import '../repositories/profile_repository.dart';

class ResetAllData {
  final ProfileRepository repository;

  ResetAllData(this.repository);

  Future<void> call() async {
    await repository.resetAllData();
  }
}
