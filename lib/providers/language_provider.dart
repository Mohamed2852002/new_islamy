import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String selectedLanguage = 'en';
  bool isEnglish = true;
  changeLanguage() {
    if (selectedLanguage == 'en') {
      selectedLanguage = 'ar';
      isEnglish = false;
    } else {
      selectedLanguage = 'en';
      isEnglish = true;
    }
    notifyListeners();
  }
}
