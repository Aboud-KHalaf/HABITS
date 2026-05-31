import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_typography.dart';

class CreateHabitReminderSelector extends StatelessWidget {
  final bool isReminderEnabled;
  final ValueChanged<bool> onReminderToggled;
  final TimeOfDay? reminderTime;
  final VoidCallback onTimeTapped;

  const CreateHabitReminderSelector({
    super.key,
    required this.isReminderEnabled,
    required this.onReminderToggled,
    this.reminderTime,
    required this.onTimeTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '4. REMINDER (OPTIONAL)',
              style: AppTypography.labelMono.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w900,
              ),
            ),
            CupertinoSwitch(
              value: isReminderEnabled,
              onChanged: onReminderToggled,
              activeTrackColor: Theme.of(context).colorScheme.onSurface,
              inactiveTrackColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest,
              thumbColor: Theme.of(context).colorScheme.surface,
            ),
          ],
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: isReminderEnabled ? onTimeTapped : null,
          child: Opacity(
            opacity: isReminderEnabled ? 1.0 : 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'SET REMINDER TIME',
                      style: AppTypography.labelMono.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      reminderTime != null
                          ? reminderTime!.format(context)
                          : '--:--',
                      style: AppTypography.labelMono.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
