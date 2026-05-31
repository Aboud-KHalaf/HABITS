import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/calendar_provider.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/design_system/app_borders.dart';
import '../../../../shared/design_system/app_colors.dart';

class SelectedDateLabel extends ConsumerWidget {
  const SelectedDateLabel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateViewModelProvider);
    final dateFormat = DateFormat('MMMM dd').format(selectedDate).toUpperCase();

    return Row(
      children: [
        Expanded(
          child: Container(
            height: AppBorders.borderWidthThin,
            color: AppColors.border,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
          decoration: BoxDecoration(
            border: AppBorders.outlineMedium,
          ),
          child: Text(
            dateFormat,
            style: AppTypography.labelMono,
          ),
        ),
        Expanded(
          child: Container(
            height: AppBorders.borderWidthThin,
            color: AppColors.border,
          ),
        ),
      ],
    );
  }
}
