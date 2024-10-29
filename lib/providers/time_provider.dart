import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:new_islamy/models/pray_time_model.dart';
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
    List<String> praytime = prayTime.split(':');
    int hour = int.parse(praytime[0]);
    if (hour <= 12) {
    } else {
      hour -= 12;
    }
    return '$hour:${praytime[1]}';
  }

  DateTime switchToDateTime(String prayTime) {
    List<String> praytimes = prayTime.split(':');
    int hour = int.parse(praytimes[0]);
    int minute = int.parse(praytimes[1]);
    DateTime prayerTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minute);
    return prayerTime;
  }

  late PrayTimeModel prayTimeModel;
  PrayTimeService prayTimeService = PrayTimeService();
  List<DateTime> prayerTimes = [];

  initPrayTime() async {
    await audioPlayer.setAsset('assets/sounds/adhan.mp3');
    prayTimeModel = await prayTimeService.getPrayTime();
    prayerTimes = [
      switchToDateTime(prayTimeModel.fajrTime),
      switchToDateTime(prayTimeModel.dhuhrTime),
      switchToDateTime(prayTimeModel.asrTime),
      switchToDateTime(prayTimeModel.maghribTime),
      switchToDateTime(prayTimeModel.ishaTime),
    ];
  }

  Timer? timer;
  Duration duration = const Duration();
  int index = 0;
  AudioPlayer audioPlayer = AudioPlayer();
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
          if (canPlayAdhan) {
            audioPlayer.play();
          }
          if (index == 4) {
            index = 0;
          } else {
            index++;
          }
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
