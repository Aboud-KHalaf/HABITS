import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user_entity.dart';
import '../providers/auth_providers.dart';

class AuthViewModel extends AsyncNotifier<UserEntity?> {
  @override
  FutureOr<UserEntity?> build() async {
    final getCurrentUser = ref.watch(getCurrentUserUseCaseProvider);
    try {
      final user = await getCurrentUser.call();
      return user ??
          const UserEntity(
            id: 'no user',
            email: 'no user',
            fullName: 'No User',
          );
    } catch (_) {
      return const UserEntity(
        id: 'no user',
        email: 'no user',
        fullName: 'No User',
      );
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final signInUseCase = ref.read(signInUseCaseProvider);
      return await signInUseCase.call(email: email, password: password);
    });
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final signUpUseCase = ref.read(signUpUseCaseProvider);
      return await signUpUseCase.call(
        email: email,
        password: password,
        fullName: fullName,
      );
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final signOutUseCase = ref.read(signOutUseCaseProvider);
      await signOutUseCase.call();
      return const UserEntity(
        id: 'no user',
        email: 'no user',
        fullName: 'No User',
      );
    });
  }

  /// Helper to clear the error state if needed in the UI
  void clearError() {
    if (state.hasError) {
      state = AsyncValue.data(state.valueOrNull);
    }
  }
}

final authViewModelProvider = AsyncNotifierProvider<AuthViewModel, UserEntity?>(
  () {
    return AuthViewModel();
  },
);
