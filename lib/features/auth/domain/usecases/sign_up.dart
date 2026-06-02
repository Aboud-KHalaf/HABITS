import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SignUp {
  final AuthRepository repository;

  SignUp(this.repository);

  Future<UserEntity?> call({
    required String email,
    required String password,
    required String fullName,
  }) async {
    return await repository.signUp(
      email: email,
      password: password,
      fullName: fullName,
    );
  }
}
