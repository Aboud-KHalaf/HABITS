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
    );
  }
}