import '../entities/analytics_summary_entity.dart';
import '../repositories/analytics_repository.dart';

class GetAnalyticsSummaryUseCase {
  final AnalyticsRepository _repository;

  GetAnalyticsSummaryUseCase(this._repository);

  Future<AnalyticsSummaryEntity> call() async {
    return await _repository.getAnalyticsSummary();
  }
}