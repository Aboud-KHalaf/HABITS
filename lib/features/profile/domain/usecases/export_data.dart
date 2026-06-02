import '../repositories/profile_repository.dart';

class ExportData {
  final ProfileRepository repository;

  ExportData(this.repository);

  Future<void> call() async {
    await repository.exportData();
  }
}
