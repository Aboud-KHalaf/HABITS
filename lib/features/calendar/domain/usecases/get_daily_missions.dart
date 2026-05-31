import '../entities/daily_mission_entity.dart';
import '../repositories/calendar_repository.dart';

class GetDailyMissions {
  final CalendarRepository repository;

  GetDailyMissions(this.repository);

  Future<List<DailyMissionEntity>> call(DateTime date) async {
    return await repository.getDailyMissions(date);
  }
}
