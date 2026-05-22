import 'package:flutter/material.dart';
import '../design_system/app_borders.dart';
import '../design_system/app_colors.dart';
import '../design_system/app_dimensions.dart';
import '../design_system/app_shadows.dart';
import '../design_system/app_typography.dart';
import '../design_system/app_spacing.dart';

/// A Neo-Brutalist button with hard shadows and thick borders.
class BrutalButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Widget? icon;

  const BrutalButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.neonYellow,
    this.textColor = AppColors.black,
    this.borderColor = AppColors.black,
    this.icon,
  });

  @override
  State<BrutalButton> createState() => _BrutalButtonState();
}

class _BrutalButtonState extends State<BrutalButton> {
  bool _isPressed = false;
  bool _isHovered = false;

  void _onPointerDown(PointerDownEvent event) => setState(() => _isPressed = true);
  void _onPointerUp(PointerUpEvent event) => setState(() => _isPressed = false);
  void _onPointerCancel(PointerCancelEvent event) => setState(() => _isPressed = false);

  @override
  Widget build(BuildContext context) {
    final displayColor = _isHovered ? AppColors.shockingPink : widget.backgroundColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Listener(
        onPointerDown: _onPointerDown,
        onPointerUp: _onPointerUp,
        onPointerCancel: _onPointerCancel,
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            transform: Matrix4.translationValues(
              _isPressed ? 5.0 : 0.0,
              _isPressed ? 5.0 : 0.0,
              0.0,
            ),
            decoration: BoxDecoration(
              color: displayColor,
              border: Border.all(
                color: widget.borderColor,
                width: AppBorders.borderWidthThin,
              ),
              boxShadow: _isPressed ? [] : [AppShadows.level1],
            ),
            height: AppDimensions.buttonHeight,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null) ...[
                    widget.icon!,
                    AppSpacing.gapWXS,
                  ],
                  Text(
                    widget.text.toUpperCase(),
                    style: AppTypography.headlineMd.copyWith(
                      color: widget.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
