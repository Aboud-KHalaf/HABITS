import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_typography.dart';

class CreateHabitNameInput extends StatelessWidget {
  final TextEditingController controller;

  const CreateHabitNameInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1. HABIT NAME',
          style: AppTypography.labelMono.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          style: AppTypography.bodyLg.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            hintText: 'E.g. Drink Water',
            hintStyle: AppTypography.bodyLg.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                width: 2,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
