import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/screens/app_home_navigation.dart';
import 'package:new_islamy/screens/intro_screen.dart';
import 'package:new_islamy/widgets/head_logo_widget.dart';
import 'package:new_islamy/widgets/onboarding_screen_widget.dart';
import 'package:new_islamy/widgets/progress_dots.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HeadLogoWidget(),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              children: [
                const IntroScreen(),
                OnboardingScreenWidget(
                  image: 'assets/images/kabba.png',
                  label: AppLocalizations.of(context)!.welcome_islami,
                  info: AppLocalizations.of(context)!.welcome_islami_info,
                  imageWidth: 371,
                ),
                OnboardingScreenWidget(
                  image: 'assets/images/quran.png',
                  label: AppLocalizations.of(context)!.read_quran,
                  info: AppLocalizations.of(context)!.read_quran_info,
                  imageWidth: 287,
                ),
                OnboardingScreenWidget(
                  image: 'assets/images/bearish.png',
                  label: AppLocalizations.of(context)!.bearish,
                  info: AppLocalizations.of(context)!.bearish_info,
                  imageWidth: 305,
                ),
                OnboardingScreenWidget(
                  image: 'assets/images/radio.png',
                  label: AppLocalizations.of(context)!.holy_quran_radio,
                  info: AppLocalizations.of(context)!.holy_quran_radio_info,
                  imageWidth: 215,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex--;
                      pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    });
                  },
                  child: Text(
                    textAlign: TextAlign.center,
                    currentIndex != 0
                        ? AppLocalizations.of(context)!.back_button_boarding
                        : '',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 16.sp),
                  ),
                ),
              ),
              Expanded(child: ProgressDots(currentIndex: currentIndex)),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (currentIndex == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AppHomeNavigation(),
                        ),
                      );
                    }
                    setState(() {
                      currentIndex++;
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    });
                  },
                  child: Text(
                    textAlign: TextAlign.center,
                    currentIndex != 4
                        ? AppLocalizations.of(context)!.next_button_boarding
                        : AppLocalizations.of(context)!.finish_button_boarding,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 16.sp),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 47.h)
        ],
      ),
    );
  }
}
