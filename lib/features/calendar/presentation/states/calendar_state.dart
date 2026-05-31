class CalendarState {
  final DateTime currentMonth;
  final Map<String, List<MissionMock>> missionsByDate;

  const CalendarState({
    required this.currentMonth,
    this.missionsByDate = const {},
  });

  CalendarState copyWith({
    DateTime? currentMonth,
    Map<String, List<MissionMock>>? missionsByDate,
  }) {
    return CalendarState(
      currentMonth: currentMonth ?? this.currentMonth,
      missionsByDate: missionsByDate ?? this.missionsByDate,
    );
  }
}

class MissionMock {
  final String id;
  final String title;
  final bool isCompleted;

  const MissionMock({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  MissionMock copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return MissionMock(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
