import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/widgets/brutal_card.dart';
import '../../../../shared/responsive/responsive_builder.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../widgets/auth_sign_up_form.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to authentication state errors
    ref.listen(authViewModelProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        final error = next.error;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.deepRed,
            content: Text(
              error
                  .toString()
                  .replaceAll('Exception: ', '')
                  .replaceAll('UnimplementedError: ', ''),
              style: AppTypography.bodyMd.copyWith(color: AppColors.white),
            ),
            action: SnackBarAction(
              label: 'DISMISS',
              textColor: AppColors.neonYellow,
              onPressed: () {
                ref.read(authViewModelProvider.notifier).clearError();
              },
            ),
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ResponsiveBuilder(
              builder: (context, screenSize, constraints) {
                final formWidth = screenSize.isMobile ? double.infinity : 450.0;

                final formContent = Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'CREATE ACCOUNT',
                      textAlign: TextAlign.center,
                      style: AppTypography.headlineLg.copyWith(
                        color: AppColors.neonYellow,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'START YOUR HABIT TRACKING MISSION.',
                      textAlign: TextAlign.center,
                      style: AppTypography.labelMono.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 48),
                    const AuthSignUpForm(),
                  ],
                );

                if (screenSize.isMobile) {
                  return formContent;
                }

                // For Tablet / Desktop, wrap in a BrutalCard for a premium centered experience
                return SizedBox(
                  width: formWidth,
                  child: BrutalCard(
                    backgroundColor: AppColors.surfaceContainer,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 40),
                    child: formContent,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
