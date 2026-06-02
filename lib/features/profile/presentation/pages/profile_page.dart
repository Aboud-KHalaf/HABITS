import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/presentation/viewmodels/auth_viewmodel.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/widgets/brutal_button.dart';
import '../../../../shared/widgets/brutal_card.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'PROFILE',
                style: AppTypography.headlineLg.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'YOUR IDENTITY AND METRICS.',
                style: AppTypography.labelMono.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),
              authState.when(
                data: (user) {
                  if (user == null) {
                    return const Expanded(
                      child: Center(
                        child: Text(
                          'NOT AUTHENTICATED',
                          style: AppTypography.headlineMd,
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        BrutalCard(
                          backgroundColor: AppColors.surfaceContainer,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'FULL NAME',
                                style: AppTypography.labelMono.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                user.fullName.toUpperCase(),
                                style: AppTypography.headlineMd.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'EMAIL ADDRESS',
                                style: AppTypography.labelMono.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                user.email,
                                style: AppTypography.bodyLg.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        BrutalButton(
                          text: 'SIGN OUT ✓',
                          backgroundColor: AppColors.deepRed,
                          textColor: AppColors.white,
                          onPressed: () {
                            ref.read(authViewModelProvider.notifier).signOut();
                          },
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  );
                },
                loading: () => const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.neonYellow,
                    ),
                  ),
                ),
                error: (error, _) => Expanded(
                  child: Center(
                    child: Text(
                      'ERROR: $error',
                      style: AppTypography.bodyLg.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
