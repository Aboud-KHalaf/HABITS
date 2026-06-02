import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../mappers/user_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<UserEntity?> signIn({
    required String email,
    required String password,
  }) async {
    final model = await _remoteDataSource.signIn(
      email: email,
      password: password,
    );
    return model != null ? UserMapper.toEntity(model) : null;
  }

  @override
  Future<UserEntity?> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    final model = await _remoteDataSource.signUp(
      email: email,
      password: password,
      fullName: fullName,
    );
    return model != null ? UserMapper.toEntity(model) : null;
  }

  @override
  Future<void> signOut() async {
    await _remoteDataSource.signOut();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final model = await _remoteDataSource.getCurrentUser();
    return model != null ? UserMapper.toEntity(model) : null;
  }
}
