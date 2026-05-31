class CalendarDayModel {
  final DateTime date;
  final int totalHabits;
  final int completedHabits;
  final bool isCurrentMonth;
  final bool isToday;

  const CalendarDayModel({
    required this.date,
    required this.totalHabits,
    required this.completedHabits,
    required this.isCurrentMonth,
    required this.isToday,
  });
}
