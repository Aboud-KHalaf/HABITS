import '../entities/analytics_summary_entity.dart';

abstract class AnalyticsRepository {
  /// Fetches the aggregated analytics summary data for the dashboard.
  Future<AnalyticsSummaryEntity> getAnalyticsSummary();
}