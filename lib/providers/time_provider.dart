import 'dart:async';
import 'dart:convert';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:new_islamy/models/pray_time_model.dart';
import 'package:new_islamy/services/notification_service.dart';
import 'package:new_islamy/services/pray_time_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeProvider extends ChangeNotifier {
  Future<List<String>> getAzkar(String zekrArabicName) async {
    List<String> azkar = [];
    final String azkarJsonContent =
        await rootBundle.loadString('assets/azkar.json');
    Map<String, dynamic> jsonData = jsonDecode(azkarJsonContent);
    for (var i = 0; i < jsonData[zekrArabicName].length; i++) {
      azkar.add(jsonData[zekrArabicName][i]["count"]);
      azkar.add(jsonData[zekrArabicName][i]["content"]);
    }
    return azkar;
  }

  String setPrayerTime(String prayTime) {
    DateFormat inputFormat = DateFormat("HH:mm");
    DateTime dateTime = inputFormat.parse(prayTime);
    DateFormat outputFormat = DateFormat("hh:mm a");
    return outputFormat.format(dateTime);
  }

  DateTime switchToDateTime(String prayTime) {
    List<String> praytimes = prayTime.split(':');
    int hour = int.parse(praytimes[0]);
    int minute = int.parse(praytimes[1]);
    late DateTime prayerTime;
    prayerTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minute);

    return prayerTime;
  }

  late PrayTimeModel prayTimeModel;
  PrayTimeService prayTimeService = PrayTimeService();
  List<DateTime> prayerTimes = [];
  NotificationService notificationService = NotificationService();

  initPrayTime() async {
    prayTimeModel = await prayTimeService.getPrayTime();
    prayerTimes = [
      switchToDateTime(prayTimeModel.fajrTime),
      switchToDateTime(prayTimeModel.dhuhrTime),
      switchToDateTime(prayTimeModel.asrTime),
      switchToDateTime(prayTimeModel.maghribTime),
      switchToDateTime(prayTimeModel.ishaTime),
    ];
  }

  List<String> prayerNames = [
    'الفجر',
    'الظهر',
    'العصر',
    'المغرب',
    'العشاء',
  ];
  initPrayTimeMain() async {
    DateTime now = DateTime.now();
    prayTimeModel = await prayTimeService.getPrayTime();
    prayerTimes = [
      switchToDateTime(prayTimeModel.fajrTime),
      switchToDateTime(prayTimeModel.dhuhrTime),
      switchToDateTime(prayTimeModel.asrTime),
      switchToDateTime(prayTimeModel.maghribTime),
      switchToDateTime(prayTimeModel.ishaTime),
    ];
    if (canPlayAdhan) {
      await Alarm.set(
          alarmSettings: NotificationService.returnAlarmSettings(
              51,
              now.isAfter(prayerTimes[0])
                  ? prayerTimes[0].add(Duration(days: 1))
                  : prayerTimes[0],
              prayerNames[0]));
      await Alarm.set(
          alarmSettings: NotificationService.returnAlarmSettings(
              52,
              now.isAfter(prayerTimes[1])
                  ? prayerTimes[1].add(Duration(days: 1))
                  : prayerTimes[1],
              prayerNames[1]));
      await Alarm.set(
          alarmSettings: NotificationService.returnAlarmSettings(
              53,
              now.isAfter(prayerTimes[2])
                  ? prayerTimes[2].add(Duration(days: 1))
                  : prayerTimes[2],
              prayerNames[2]));
      await Alarm.set(
          alarmSettings: NotificationService.returnAlarmSettings(
              54,
              now.isAfter(prayerTimes[3])
                  ? prayerTimes[3].add(Duration(days: 1))
                  : prayerTimes[3],
              prayerNames[3]));

      await Alarm.set(
          alarmSettings: NotificationService.returnAlarmSettings(
              55,
              now.isAfter(prayerTimes[4])
                  ? prayerTimes[4].add(Duration(days: 1))
                  : prayerTimes[4],
              prayerNames[4]));
    } else {
      Alarm.stopAll();
    }
  }

  Timer? timer;
  Duration duration = const Duration();
  int index = 0;
  bool canPlayAdhan = true;
  void startCountdown() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (DateTime.now().isAfter(switchToDateTime(prayTimeModel.ishaTime)) &&
        DateTime.now().isBefore(switchToDateTime(prayTimeModel.fajrTime))) {
      index = 0;
    } else if (DateTime.now()
            .isAfter(switchToDateTime(prayTimeModel.fajrTime)) &&
        DateTime.now().isBefore(switchToDateTime(prayTimeModel.dhuhrTime))) {
      index = 1;
    } else if (DateTime.now()
            .isAfter(switchToDateTime(prayTimeModel.dhuhrTime)) &&
        DateTime.now().isBefore(switchToDateTime(prayTimeModel.asrTime))) {
      index = 2;
    } else if (DateTime.now()
            .isAfter(switchToDateTime(prayTimeModel.asrTime)) &&
        DateTime.now().isBefore(switchToDateTime(prayTimeModel.maghribTime))) {
      index = 3;
    } else if (DateTime.now()
            .isAfter(switchToDateTime(prayTimeModel.maghribTime)) &&
        DateTime.now().isBefore(switchToDateTime(prayTimeModel.ishaTime))) {
      index = 4;
    }
    sharedPreferences.setInt('prayerIndex', index);
    sharedPreferences.setBool('playAdhan', true);
    timer?.cancel();
    DateTime now = DateTime.now();
    DateTime targetTime = prayerTimes[index];
    if (targetTime.isAfter(now)) {
      duration = targetTime.difference(now);
    } else {
      duration = targetTime.difference(now) + const Duration(hours: 24);
    }
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (duration.inSeconds <= 0) {
          startCountdown();
          notifyListeners();
        } else {
          duration -= const Duration(seconds: 1);
        }
        notifyListeners();
      },
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  muteAdhan() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (canPlayAdhan) {
      canPlayAdhan = false;
      sharedPreferences.setBool('playAdhan', false);
    } else {
      canPlayAdhan = true;
      sharedPreferences.setBool('playAdhan', true);
    }
    notifyListeners();
  }

  TimeProvider({bool playAdhan = true}) {
    canPlayAdhan = playAdhan ? true : false;
  }
}
