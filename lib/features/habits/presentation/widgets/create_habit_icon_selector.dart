import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';

class CreateHabitIconSelector extends StatelessWidget {
  final int selectedIconCodePoint;
  final ValueChanged<int> onIconSelected;

  const CreateHabitIconSelector({
    super.key,
    required this.selectedIconCodePoint,
    required this.onIconSelected,
  });

  // A list of hardcoded icons mimicking the design
  static const List<IconData> _icons = [
    Icons.fitness_center,
    Icons.water_drop_outlined,
    Icons.book_outlined,
    Icons.directions_run,
    Icons.self_improvement,
    Icons.computer,
    Icons.restaurant,
    Icons.bed_outlined,
    Icons.attach_money,
    Icons.psychology_outlined,
    Icons.brush_outlined,
    Icons.music_note,
    Icons.people_outline,
    Icons.monitor_heart_outlined,
    Icons.cleaning_services_outlined,
    Icons.eco_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '2. ICON (SELECT ONE)',
          style: AppTypography.labelMono.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: _icons.length,
          itemBuilder: (context, index) {
            final icon = _icons[index];
            final isSelected = icon.codePoint == selectedIconCodePoint;

            return GestureDetector(
              onTap: () => onIconSelected(icon.codePoint),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.electricGreen : AppColors.transparent,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: AppColors.white,
                    size: 28,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
