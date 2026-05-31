import '../entities/calendar_day_entity.dart';
import '../repositories/calendar_repository.dart';

class GetMonthlyCompletions {
  final CalendarRepository repository;

  GetMonthlyCompletions(this.repository);

  Future<List<CalendarDayEntity>> call(int year, int month) async {
    return await repository.getMonthlyCompletions(year, month);
  }
}
