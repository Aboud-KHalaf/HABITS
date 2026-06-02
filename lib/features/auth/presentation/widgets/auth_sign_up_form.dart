import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/widgets/brutal_button.dart';
import '../viewmodels/auth_viewmodel.dart';
import 'auth_text_field.dart';

class AuthSignUpForm extends ConsumerStatefulWidget {
  const AuthSignUpForm({super.key});

  @override
  ConsumerState<AuthSignUpForm> createState() => _AuthSignUpFormState();
}

class _AuthSignUpFormState extends ConsumerState<AuthSignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(authViewModelProvider.notifier).signUp(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
            fullName: _nameController.text.trim(),
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
            controller: _nameController,
            labelText: 'Full Name',
            hintText: 'Enter your full name',
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Full name is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
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
            hintText: 'Create a password',
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
              text: 'CREATE ACCOUNT ✓',
              backgroundColor: AppColors.neonYellow,
              textColor: AppColors.black,
              onPressed: _submit,
            ),
          const SizedBox(height: 24),
          Center(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Text(
                "ALREADY HAVE AN ACCOUNT? SIGN IN",
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
