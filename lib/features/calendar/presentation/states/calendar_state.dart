import '../../domain/entities/daily_mission_entity.dart';

class CalendarState {
  final DateTime currentMonth;
  final Map<String, List<DailyMissionEntity>> missionsByDate;
  final Set<String> loadingDates;

  const CalendarState({
    required this.currentMonth,
    this.missionsByDate = const {},
    this.loadingDates = const {},
  });

  CalendarState copyWith({
    DateTime? currentMonth,
    Map<String, List<DailyMissionEntity>>? missionsByDate,
    Set<String>? loadingDates,
  }) {
    return CalendarState(
      currentMonth: currentMonth ?? this.currentMonth,
      missionsByDate: missionsByDate ?? this.missionsByDate,
      loadingDates: loadingDates ?? this.loadingDates,
    );
  }
}
