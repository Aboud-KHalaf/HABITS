import '../../domain/entities/habit_completion_entity.dart';
import '../../domain/entities/habit_entity.dart';
import '../../domain/enums/habit_completion_status.dart';
import '../../domain/enums/habit_frequency.dart';
import '../models/habit_completion_model.dart';
import '../models/habit_model.dart';

class HabitMapper {
  static HabitModel toModel(HabitEntity entity) {
    return HabitModel(
      id: entity.id,
      name: entity.name,
      iconCodePoint: entity.iconCodePoint,
      frequency: entity.frequency.name,
      selectedWeekDays: entity.selectedWeekDays,
      reminderTime: entity.reminderTime,
      notes: entity.notes,
      createdAt: entity.createdAt,
      notificationId: entity.notificationId,
    );
  }

  static HabitEntity toEntity(HabitModel model) {
    return HabitEntity(
      id: model.id,
      name: model.name,
      iconCodePoint: model.iconCodePoint,
      frequency: HabitFrequency.values.firstWhere(
        (e) => e.name == model.frequency,
        orElse: () => HabitFrequency.daily,
      ),
      selectedWeekDays: model.selectedWeekDays,
      reminderTime: model.reminderTime,
      notes: model.notes,
      createdAt: model.createdAt,
      notificationId: model.notificationId,
    );
  }
}

class HabitCompletionMapper {
  static HabitCompletionModel toModel(HabitCompletionEntity entity) {
    return HabitCompletionModel(
      id: entity.id,
      habitId: entity.habitId,
      date: entity.date,
      status: entity.status.name,
    );
  }

  static HabitCompletionEntity toEntity(HabitCompletionModel model) {
    return HabitCompletionEntity(
      id: model.id,
      habitId: model.habitId,
      date: model.date,
      status: HabitCompletionStatus.values.firstWhere(
        (e) => e.name == model.status,
        orElse: () => HabitCompletionStatus.completed,
      ),
    );
  }
}
