import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xffE2BE7F);
  static const secondaryColor = Color(0xff202020);
  static const tertiaryColor = Color(0xff707070);
  static final appStyle = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: tertiaryColor,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: primaryColor,
    ),
    scaffoldBackgroundColor: secondaryColor,
    textTheme: const TextTheme(
      labelSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          fontFamily: 'Janna LT',
          color: primaryColor),
    ),
  );
}
