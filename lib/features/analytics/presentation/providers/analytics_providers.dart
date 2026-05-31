import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/analytics_local_datasource.dart';
import '../../data/repositories/analytics_repository_impl.dart';
import '../../domain/repositories/analytics_repository.dart';
import '../../domain/usecases/get_analytics_summary_usecase.dart';

// Local DataSource
final analyticsLocalDataSourceProvider = Provider<AnalyticsLocalDataSource>((
  ref,
) {
  return AnalyticsLocalDataSourceImpl();
});

// Repository
final analyticsRepositoryProvider = Provider<AnalyticsRepository>((ref) {
  final dataSource = ref.watch(analyticsLocalDataSourceProvider);
  return AnalyticsRepositoryImpl(dataSource);
});

// Use Cases
final getAnalyticsSummaryUseCaseProvider = Provider<GetAnalyticsSummaryUseCase>(
  (ref) {
    final repository = ref.watch(analyticsRepositoryProvider);
    return GetAnalyticsSummaryUseCase(repository);
  },
);
