import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Janna LT',
            color: primaryColor),
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            return states.contains(WidgetState.selected)
                ? const IconThemeData(color: Colors.white)
                : const IconThemeData(color: secondaryColor);
          },
        ),
        backgroundColor: primaryColor,
        indicatorColor: secondaryColor.withOpacity(0.6),
      ),
      scaffoldBackgroundColor: secondaryColor,
      textTheme: TextTheme(
        labelSmall: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Janna LT',
            color: primaryColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        prefixIconColor: primaryColor,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      dividerTheme: const DividerThemeData(
        indent: 30,
        endIndent: 30,
      ),
      iconTheme: const IconThemeData(color: secondaryColor));
}
