import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habits/shared/design_system/app_borders.dart';

class AddHabitFab extends StatelessWidget {
  const AddHabitFab({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/create-habit');
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface,
            width: AppBorders.borderWidthThin,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface,
              offset: const Offset(4.0, 4.0),
              blurRadius: 0.0,
            ),
          ],
        ),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimary,
          size: 32,
        ),
      ),
    );
  }
}
