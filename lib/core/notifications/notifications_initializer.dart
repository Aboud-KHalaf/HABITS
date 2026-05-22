// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationsInitializer {
//   NotificationsInitializer._();

//   static final FlutterLocalNotificationsPlugin _plugin =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> init() async {
//     const androidSettings = AndroidInitializationSettings(
//       '@mipmap/ic_launcher',
//     );

//     const darwinSettings = DarwinInitializationSettings(
//       requestAlertPermission: false,
//       requestBadgePermission: false,
//       requestSoundPermission: false,
//     );

//     const initializationSettings = InitializationSettings(
//       android: androidSettings,
//       iOS: darwinSettings,
//       macOS: darwinSettings,
//     );

//     await _plugin.initialize(initializationSettings);
//   }

//   static Future<void> requestPermissions() async {
//     final androidPlugin = _plugin
//         .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin
//         >();
//     await androidPlugin?.requestNotificationsPermission();

//     final iosPlugin = _plugin
//         .resolvePlatformSpecificImplementation<
//           IOSFlutterLocalNotificationsPlugin
//         >();
//     await iosPlugin?.requestPermissions(alert: true, badge: true, sound: true);

//     final macOSPlugin = _plugin
//         .resolvePlatformSpecificImplementation<
//           MacOSFlutterLocalNotificationsPlugin
//         >();
//     await macOSPlugin?.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
// }
