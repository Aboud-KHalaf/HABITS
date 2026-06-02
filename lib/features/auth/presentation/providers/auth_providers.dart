import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/get_current_user.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/sign_out.dart';
import '../../domain/usecases/sign_up.dart';

// DataSource Provider
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl();
});

// Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(dataSource);
});

// Use Cases Providers
final signInUseCaseProvider = Provider<SignIn>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignIn(repository);
});

final signUpUseCaseProvider = Provider<SignUp>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignUp(repository);
});

final signOutUseCaseProvider = Provider<SignOut>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignOut(repository);
});

final getCurrentUserUseCaseProvider = Provider<GetCurrentUser>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return GetCurrentUser(repository);
});
