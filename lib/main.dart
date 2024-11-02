import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:new_islamy/new_islamy.dart';
import 'package:new_islamy/providers/language_provider.dart';
import 'package:new_islamy/providers/time_provider.dart';
import 'package:new_islamy/services/notification_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

TimeProvider timeProvider = TimeProvider();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestExactAlarmsPermission();
  await NotificationService.initnotification();
  await timeProvider.initPrayTimeMain();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(
          isToGoHome: sharedPreferences.getBool('toHome') ?? false,
          langIsEnglish: sharedPreferences.getBool('isEnglish') ?? true),
      child: const NewIslamy(),
    ),
  );
}
