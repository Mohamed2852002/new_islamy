import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String selectedLanguage = 'en';
  bool isEnglish = true;
  changeLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (selectedLanguage == 'en') {
      sharedPreferences.setBool('isEnglish', false);
      selectedLanguage = 'ar';
      isEnglish = false;
    } else {
      sharedPreferences.setBool('isEnglish', true);
      selectedLanguage = 'en';
      isEnglish = true;
    }
    notifyListeners();
  }

  bool goToHome = false;

  LanguageProvider({bool langIsEnglish = true, bool isToGoHome = false}) {
    selectedLanguage = langIsEnglish ? 'en' : 'ar';
    isEnglish = langIsEnglish ? true : false;
    goToHome = isToGoHome ? true : false;
  }
}
