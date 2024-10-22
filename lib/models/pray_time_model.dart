class PrayTimeModel {
  final String fajrTime;
  final String dhuhrTime;
  final String asrTime;
  final String maghribTime;
  final String ishaTime;
  final String hijriDateDay;
  final String hijriDateMonth;
  final String hijriDateYear;
  final String gregorianDate;
  PrayTimeModel({
    required this.fajrTime,
    required this.dhuhrTime,
    required this.asrTime,
    required this.maghribTime,
    required this.ishaTime,
    required this.hijriDateDay,
    required this.hijriDateMonth,
    required this.hijriDateYear,
    required this.gregorianDate,
  });

  factory PrayTimeModel.fromJson(json) {
    return PrayTimeModel(
      fajrTime: json["data"]["timings"]["Fajr"],
      dhuhrTime: json["data"]["timings"]["Dhuhr"],
      asrTime: json["data"]["timings"]["Asr"],
      maghribTime: json["data"]["timings"]["Maghrib"],
      ishaTime: json["data"]["timings"]["Isha"],
      hijriDateDay: json["data"]["date"]["hijri"]["day"],
      hijriDateMonth: json["data"]["date"]["hijri"]["month"]["en"],
      hijriDateYear: json["data"]["date"]["hijri"]["year"],
      gregorianDate: json["data"]["date"]["readable"],
    );
  }
}
