import '../enums/completion_status.dart';

class CalendarDayEntity {
  final DateTime date;
  final int totalHabits;
  final int completedHabits;
  final bool isCurrentMonth;
  final bool isToday;

  const CalendarDayEntity({
    required this.date,
    required this.totalHabits,
    required this.completedHabits,
    required this.isCurrentMonth,
    required this.isToday,
  });

  CompletionStatus get status {
    if (totalHabits == 0 || completedHabits == 0) return CompletionStatus.none;
    if (completedHabits >= totalHabits) return CompletionStatus.full;
    return CompletionStatus.partial;
  }

  CalendarDayEntity copyWith({
    DateTime? date,
    int? totalHabits,
    int? completedHabits,
    bool? isCurrentMonth,
    bool? isToday,
  }) {
    return CalendarDayEntity(
      date: date ?? this.date,
      totalHabits: totalHabits ?? this.totalHabits,
      completedHabits: completedHabits ?? this.completedHabits,
      isCurrentMonth: isCurrentMonth ?? this.isCurrentMonth,
      isToday: isToday ?? this.isToday,
    );
  }
}
