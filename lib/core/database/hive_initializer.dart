import 'package:hive_ce_flutter/hive_flutter.dart';
import '../../hive_registrar.g.dart';

class HiveInitializer {
  const HiveInitializer._();

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapters();
  }
}
