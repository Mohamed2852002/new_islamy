import 'package:flutter/material.dart';
import 'package:new_islamy/new_islamy.dart';
import 'package:new_islamy/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
