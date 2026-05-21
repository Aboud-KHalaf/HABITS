import 'package:flutter/material.dart';
import '../design_system/app_borders.dart';
import '../design_system/app_colors.dart';

/// A Neo-Brutalist checkbox matching the exact DESIGN.md specification:
/// 32px x 32px square with 3px border, electric green fill when checked
/// and a thick black "X" mark touching the edges.
class BrutalCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const BrutalCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: value ? AppColors.electricGreen : AppColors.black,
          border: Border.all(
            color: value ? AppColors.black : AppColors.white,
            width: AppBorders.borderWidthThin,
          ),
        ),
        child: value
            ? CustomPaint(
                painter: _XPainter(),
              )
            : null,
      ),
    );
  }
}

class _XPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.black
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.square;

    canvas.drawLine(Offset.zero, Offset(size.width, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
