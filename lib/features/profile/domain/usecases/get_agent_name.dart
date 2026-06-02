import '../repositories/profile_repository.dart';

class GetAgentName {
  final ProfileRepository repository;

  GetAgentName(this.repository);

  Future<String> call() async {
    return await repository.getAgentName();
  }
}
