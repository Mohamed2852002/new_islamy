import 'package:flutter/material.dart';
import 'package:new_islamy/screens/onboarding_screns.dart';
import 'package:new_islamy/themes/app_theme.dart';

class NewIslamy extends StatelessWidget {
  const NewIslamy({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme.appStyle,
      debugShowCheckedModeBanner: false,
      home: const OnboardingScrens(),
    );
  }
}