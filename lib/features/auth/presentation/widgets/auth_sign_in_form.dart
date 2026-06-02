import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/widgets/brutal_button.dart';
import '../viewmodels/auth_viewmodel.dart';
import 'auth_text_field.dart';

class AuthSignInForm extends ConsumerStatefulWidget {
  const AuthSignInForm({super.key});

  @override
  ConsumerState<AuthSignInForm> createState() => _AuthSignInFormState();
}

class _AuthSignInFormState extends ConsumerState<AuthSignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(authViewModelProvider.notifier).signIn(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    final isLoading = authState.isLoading;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthTextField(
            controller: _emailController,
            labelText: 'Email Address',
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Email is required';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value.trim())) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          AuthTextField(
            controller: _passwordController,
            labelText: 'Password',
            hintText: 'Enter your password',
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          if (isLoading)
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHigh,
                border: Border.all(
                  color: AppColors.white,
                  width: 3.0,
                ),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.neonYellow,
                ),
              ),
            )
          else
            BrutalButton(
              text: 'SIGN IN →',
              backgroundColor: AppColors.neonYellow,
              textColor: AppColors.black,
              onPressed: _submit,
            ),
          const SizedBox(height: 24),
          Center(
            child: GestureDetector(
              onTap: () => context.push('/sign-up'),
              child: Text(
                "DON'T HAVE AN ACCOUNT? SIGN UP",
                style: AppTypography.labelMono.copyWith(
                  color: AppColors.neonYellow,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
