import '../entities/completion_summary_entity.dart';
import '../repositories/calendar_repository.dart';

class GetCompletionSummary {
  final CalendarRepository repository;

  GetCompletionSummary(this.repository);

  Future<CompletionSummaryEntity> call(DateTime date) async {
    return await repository.getCompletionSummary(date);
  }
}
