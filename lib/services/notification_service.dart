import 'package:alarm/alarm.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future initnotification() async {
    await Alarm.init();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/icon_logo');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static AlarmSettings returnAlarmSettings(
      int id, DateTime prayerTime, String prayerName) {
    return AlarmSettings(
      id: id,
      dateTime: prayerTime,
      assetAudioPath: 'assets/sounds/adhan.mp3',
      loopAudio: false,
      vibrate: true,
      volume: 1,
      notificationSettings: NotificationSettings(
        title: 'موعد ألأذان',
        body: 'حان الأن موعد أذان $prayerName',
        stopButton: 'Stop',
        icon: '@mipmap/icon_logo',
      ),
    );
  }
}
