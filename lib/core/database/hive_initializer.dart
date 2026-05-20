import 'package:hive_ce_flutter/hive_flutter.dart';

class HiveInitializer {
  const HiveInitializer._();

  static Future<void> init() async {
    await Hive.initFlutter();
  }
}
