import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/analytics_summary_entity.dart';
import '../providers/analytics_providers.dart';

class AnalyticsViewModel extends AsyncNotifier<AnalyticsSummaryEntity> {
  @override
  FutureOr<AnalyticsSummaryEntity> build() async {
    return _fetchAnalyticsSummary();
  }

  Future<AnalyticsSummaryEntity> _fetchAnalyticsSummary() async {
    final useCase = ref.read(getAnalyticsSummaryUseCaseProvider);
    return await useCase();
  }

  /// Manually trigger a refresh of the analytics data
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchAnalyticsSummary());
  }
}

final analyticsViewModelProvider =
    AsyncNotifierProvider<AnalyticsViewModel, AnalyticsSummaryEntity>(() {
  return AnalyticsViewModel();
});});
