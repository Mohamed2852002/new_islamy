import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/screens/onboarding_screens.dart';
import 'package:new_islamy/themes/app_theme.dart';

class NewIslamy extends StatelessWidget {
  const NewIslamy({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: AppTheme.appStyle,
        debugShowCheckedModeBanner: false,
        home: const OnboardingScreens(),
      ),
    );
  }
}
