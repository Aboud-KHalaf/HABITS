import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel?> signIn({
    required String email,
    required String password,
  });

  Future<UserModel?> signUp({
    required String email,
    required String password,
    required String fullName,
  });

  Future<void> signOut();

  Future<UserModel?> getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel?> signIn({
    required String email,
    required String password,
  }) async {
    // TODO: Implement Firebase Authentication signIn logic here
    throw UnimplementedError('signIn() has not been implemented.');
  }

  @override
  Future<UserModel?> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    // TODO: Implement Firebase Authentication signUp logic here
    throw UnimplementedError('signUp() has not been implemented.');
  }

  @override
  Future<void> signOut() async {
    // TODO: Implement Firebase Authentication signOut logic here
    throw UnimplementedError('signOut() has not been implemented.');
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    // TODO: Implement Firebase Authentication getCurrentUser logic here
    throw UnimplementedError('getCurrentUser() has not been implemented.');
  }
}
