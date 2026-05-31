import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_typography.dart';

class CreateHabitNotesInput extends StatelessWidget {
  final TextEditingController controller;

  const CreateHabitNotesInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '5. NOTES (OPTIONAL)',
          style: AppTypography.labelMono.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          style: AppTypography.bodyMd.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          maxLength: 100,
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'Why is this habit important to you?',
            hintStyle: AppTypography.bodyMd.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            counterStyle: AppTypography.labelMono.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
