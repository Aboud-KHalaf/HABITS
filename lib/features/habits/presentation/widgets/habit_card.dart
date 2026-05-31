import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_borders.dart';
import '../../../../shared/design_system/app_typography.dart';

/// A Neo-Brutalist habit card matching the screenshot layout exactly:
/// - Title + Fire Streak badge on the top row
/// - Status indicator dot + text on the second row
/// - Action button (MARK DONE / UNDO) at the bottom
class HabitCard extends StatelessWidget {
  final String title;
  final int streak;
  final bool isCompleted;
  final VoidCallback onToggle;

  const HabitCard({
    super.key,
    required this.title,
    required this.streak,
    required this.isCompleted,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCompleted
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: isCompleted
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.onSurface,
          width: AppBorders.borderWidthThin,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.surface,
            offset: const Offset(5.0, 5.0),
            blurRadius: 0.0,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title.toUpperCase(),
                  style: AppTypography.headlineMd.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                    decorationColor: Theme.of(context).colorScheme.onSurface,
                    decorationThickness: 2.5,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _StreakBadge(streak: streak, isCompleted: isCompleted),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? Theme.of(context).colorScheme.onSurface
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                isCompleted ? 'COMPLETED' : 'NOT DONE',
                style: AppTypography.labelMono.copyWith(
                  color: isCompleted
                      ? Theme.of(context).colorScheme.onSurface
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          _CardButton(
            text: isCompleted ? 'UNDO ↶' : 'MARK DONE ✓',
            backgroundColor: isCompleted
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.onSurface,
            textColor: isCompleted
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.surface,
            onTap: onToggle,
          ),
        ],
      ),
    );
  }
}

/// Private streak badge widget helper
class _StreakBadge extends StatelessWidget {
  final int streak;
  final bool isCompleted;

  const _StreakBadge({required this.streak, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: isCompleted
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.onSurface,
          width: 2.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.local_fire_department,
            color: Colors.white,
            size: 14,
          ),
          const SizedBox(width: 4),
          Text(
            '$streak',
            style: AppTypography.labelMono.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

/// Private card button widget helper that shifts down/right when pressed
class _CardButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const _CardButton({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  State<_CardButton> createState() => _CardButtonState();
}

class _CardButtonState extends State<_CardButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        transform: Matrix4.translationValues(
          _isPressed ? 4.0 : 0.0,
          _isPressed ? 4.0 : 0.0,
          0.0,
        ),
        height: 42,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: Border.all(
            color: Theme.of(context).colorScheme.surface,
            width: AppBorders.borderWidthThin,
          ),
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.surface,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 0.0,
                  ),
                ],
        ),
        child: Center(
          child: Text(
            widget.text,
            style: AppTypography.labelMono.copyWith(
              color: widget.textColor,
              fontWeight: FontWeight.w900,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
