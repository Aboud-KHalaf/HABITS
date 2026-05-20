import 'package:hive/hive.dart';

part 'entry_model.g.dart';

@HiveType(typeId: 1)
class EntryModel extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String habitId;

  @HiveField(2)
  late int date;

  @HiveField(3)
  late bool isCompleted;

  @HiveField(4)
  late int? completedAt;
}