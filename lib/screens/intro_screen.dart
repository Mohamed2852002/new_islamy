import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/widgets/language_selector_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          SizedBox(
            width: 364.w,
            height: 400.h,
            child: Image.asset('assets/images/welcome.png'),
          ),
          SizedBox(height: 30.h),
          Text(
            AppLocalizations.of(context)!.language_choice,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: 30.h),
          Container(
            width: 135.w,
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 3.w,
              ),
            ),
            child: const LanguageSelectorWidget(),
          )
        ],
      ),
    );
  }
}
