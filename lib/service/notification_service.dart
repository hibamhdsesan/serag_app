import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart' as fln;


class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // تهيئة المنطقة الزمنية (مرة وحدة)
    tz.initializeTimeZones();

    // إعداد Android
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // إعداد iOS
    final DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    // إعداد النظامين
    final InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    // تهيئة البلغين
    await _flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
    );
  }
Future<void> scheduleNotification({
  required int id,
  required String title,
  required String body,
  required Duration delay,
}) async {
  await _flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    tz.TZDateTime.now(tz.local).add(delay),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    ),
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: null,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // ✅ هذا هو المطلوب
  );
}

Future<void> scheduleDailyFor30Days({
  required int id,
  required String title,
  required String body,
}) async {
  final now = tz.TZDateTime.now(tz.local);

  await _flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    now.add(const Duration(days: 1)), // أول إشعار بكرا بنفس الوقت
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'التذكير اليومي بالختمة',
        channelDescription: 'إشعار يومي لمدة 30 يوم بنفس الوقت',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    ),
    matchDateTimeComponents: DateTimeComponents.time, 
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  );

}

Future<void> cancelNotification(int id) async {
  await _flutterLocalNotificationsPlugin.cancel(id);
}



}
