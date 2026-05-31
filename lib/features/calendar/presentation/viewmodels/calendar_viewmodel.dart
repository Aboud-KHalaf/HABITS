import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../states/calendar_state.dart';

class CalendarViewModel extends Notifier<CalendarState> {
  @override
  CalendarState build() {
    final now = DateTime.now();
    return CalendarState(
      currentMonth: DateTime(now.year, now.month, 1),
      missionsByDate: {},
    );
  }

  void nextMonth() {
    final next = DateTime(state.currentMonth.year, state.currentMonth.month + 1, 1);
    state = state.copyWith(currentMonth: next);
  }

  void previousMonth() {
    final prev = DateTime(state.currentMonth.year, state.currentMonth.month - 1, 1);
    state = state.copyWith(currentMonth: prev);
  }

  List<MissionMock> getMissionsForDate(DateTime date) {
    final key = _dateKey(date);
    if (state.missionsByDate.containsKey(key)) {
      return state.missionsByDate[key]!;
    }
    // Generate mock missions based on date
    return _generateMockMissions(date);
  }

  void toggleMission(DateTime date, String missionId) {
    final key = _dateKey(date);
    final missions = getMissionsForDate(date);
    
    final updatedMissions = missions.map((m) {
      if (m.id == missionId) {
        return m.copyWith(isCompleted: !m.isCompleted);
      }
      return m;
    }).toList();
    
    final newMap = Map<String, List<MissionMock>>.from(state.missionsByDate);
    newMap[key] = updatedMissions;
    
    state = state.copyWith(missionsByDate: newMap);
  }

  String _dateKey(DateTime date) => '${date.year}-${date.month}-${date.day}';

  List<MissionMock> _generateMockMissions(DateTime date) {
    // Generate some stable but different missions based on the date
    final day = date.day;
    if (day % 3 == 0) {
      return [
        MissionMock(id: '1', title: 'MORNING WORKOUT', isCompleted: true),
        MissionMock(id: '2', title: 'READ 20 PAGES', isCompleted: true),
        MissionMock(id: '3', title: 'DRINK 3L WATER', isCompleted: true),
      ];
    } else if (day % 2 == 0) {
      return [
        MissionMock(id: '1', title: 'MORNING WORKOUT', isCompleted: true),
        MissionMock(id: '2', title: 'READ 20 PAGES', isCompleted: false),
      ];
    } else {
      return [
        MissionMock(id: '3', title: 'DRINK 3L WATER', isCompleted: false),
        MissionMock(id: '4', title: 'MEDITATE 10 MIN', isCompleted: false),
      ];
    }
  }
}
