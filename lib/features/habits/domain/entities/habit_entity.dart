import '../enums/habit_frequency.dart';

class HabitEntity {
  final String id;
  final String name;
  final int iconCodePoint;
  final HabitFrequency frequency;
  final List<int> selectedWeekDays;
  final DateTime? reminderTime;
  final String? notes;
  final DateTime createdAt;
  final int notificationId;
  final bool isCompletedToday;

  const HabitEntity({
    required this.id,
    required this.name,
    required this.iconCodePoint,
    required this.frequency,
    required this.selectedWeekDays,
    this.reminderTime,
    this.notes,
    required this.createdAt,
    required this.notificationId,
    this.isCompletedToday = false,
  });

  HabitEntity copyWith({
    String? id,
    String? name,
    int? iconCodePoint,
    HabitFrequency? frequency,
    List<int>? selectedWeekDays,
    DateTime? reminderTime,
    String? notes,
    DateTime? createdAt,
    int? notificationId,
    bool? isCompletedToday,
  }) {
    return HabitEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      frequency: frequency ?? this.frequency,
      selectedWeekDays: selectedWeekDays ?? this.selectedWeekDays,
      reminderTime: reminderTime ?? this.reminderTime,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      notificationId: notificationId ?? this.notificationId,
      isCompletedToday: isCompletedToday ?? this.isCompletedToday,
    );
  }

  void get toPrint {
    String str =
        'HabitEntity(id: $id, name: $name, iconCodePoint: $iconCodePoint, frequency: $frequency, selectedWeekDays: $selectedWeekDays, reminderTime: $reminderTime, notes: $notes, createdAt: $createdAt, notificationId: $notificationId)';
    print(str);
  }
}
