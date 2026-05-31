import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/design_system/app_spacing.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/responsive/adaptive_layout.dart';
import '../../domain/entities/analytics_summary_entity.dart';
import '../viewmodels/analytics_viewmodel.dart';
import '../widgets/streak_card.dart';
import '../widgets/heatmap_card.dart';
import '../widgets/weekly_performance_card.dart';
import '../widgets/single_metric_card.dart';

class AnalyticsPage extends ConsumerWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsState = ref.watch(analyticsViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () =>
              ref.read(analyticsViewModelProvider.notifier).refresh(),
          child: analyticsState.when(
            data: (summary) {
              return AdaptiveLayout(
                mobile: _buildMobileLayout(summary),
                tablet: _buildDesktopLayout(
                  summary,
                ), // Tablet can comfortably hold the 2-column layout
                desktop: _buildDesktopLayout(summary),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            error: (error, stack) => Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Text(
                  'Failed to load analytics:\n$error',
                  style: AppTypography.bodyMd.copyWith(color: AppColors.error),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(AnalyticsSummaryEntity summary) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        StreakCard(
          title: 'Current Streak',
          streak: summary.currentStreak,
          icon: const Text('🔥', style: TextStyle(fontSize: 48)),
        ),
        const SizedBox(height: AppSpacing.md),
        StreakCard(
          title: 'Best Streak',
          streak: summary.bestStreak,
          icon: const Text('⭐', style: TextStyle(fontSize: 48)),
        ),
        const SizedBox(height: AppSpacing.md),
        HeatmapCard(history: summary.history90Days),
        const SizedBox(height: AppSpacing.md),
        SingleMetricCard(
          title: 'Completion',
          metric: '${(summary.completionRate * 100).toInt()}%',
          metricColor: AppColors.primary,
        ),
        const SizedBox(height: AppSpacing.md),
        SingleMetricCard(
          title: 'Total Days',
          metric: summary.totalDays.toString(),
        ),
        const SizedBox(height: AppSpacing.md),
        WeeklyPerformanceCard(weeklyPerformance: summary.weeklyPerformance),
        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }

  Widget _buildDesktopLayout(AnalyticsSummaryEntity summary) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.xl),
      children: [
        Row(
          children: [
            Expanded(
              child: StreakCard(
                title: 'Current Streak',
                streak: summary.currentStreak,
                icon: const Text('🔥', style: TextStyle(fontSize: 48)),
              ),
            ),
            const SizedBox(width: AppSpacing.lg),
            Expanded(
              child: StreakCard(
                title: 'Best Streak',
                streak: summary.bestStreak,
                icon: const Text('⭐', style: TextStyle(fontSize: 48)),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        HeatmapCard(history: summary.history90Days),
        const SizedBox(height: AppSpacing.lg),
        Row(
          children: [
            Expanded(
              child: SingleMetricCard(
                title: 'Completion',
                metric: '${(summary.completionRate * 100).toInt()}%',
                metricColor: AppColors.primary,
              ),
            ),
            const SizedBox(width: AppSpacing.lg),
            Expanded(
              child: SingleMetricCard(
                title: 'Total Days',
                metric: summary.totalDays.toString(),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        WeeklyPerformanceCard(weeklyPerformance: summary.weeklyPerformance),
        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }
}
