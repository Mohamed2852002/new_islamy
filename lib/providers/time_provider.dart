import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
}
