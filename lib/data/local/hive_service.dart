import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../models/habit_model.dart';
import '../models/entry_model.dart';

class HiveService {
  static const String habitsBoxName = 'habits';
  static const String entriesBoxName = 'entries';
  static const String settingsBoxName = 'settings';

  static Future<void> init() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocDir.path);

    await _registerAdapters();
    await _openBoxes();
  }

  static Future<void> _registerAdapters() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(HabitModelAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(EntryModelAdapter());
    }
  }

  static Future<void> _openBoxes() async {
    await Hive.openBox<HabitModel>(habitsBoxName);
    await Hive.openBox<EntryModel>(entriesBoxName);
    await Hive.openBox(settingsBoxName);
  }

  static Box<HabitModel> get habitsBox => Hive.box<HabitModel>(habitsBoxName);
  static Box<EntryModel> get entriesBox => Hive.box<EntryModel>(entriesBoxName);
  static Box get settingsBox => Hive.box(settingsBoxName);

  static Future<void> close() async {
    await Hive.close();
  }
}