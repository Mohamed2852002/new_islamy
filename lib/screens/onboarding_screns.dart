import 'package:flutter/material.dart';
import 'package:new_islamy/screens/intro_screen.dart';
import 'package:new_islamy/widgets/head_logo_widget.dart';
import 'package:new_islamy/widgets/onboarding_screen_widget.dart';
import 'package:new_islamy/widgets/progress_dots.dart';

class OnboardingScrens extends StatefulWidget {
  const OnboardingScrens({super.key});

  @override
  State<OnboardingScrens> createState() => _OnboardingScrensState();
}

class _OnboardingScrensState extends State<OnboardingScrens> {
  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(291, 151), child: HeadLogoWidget()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              children: const [
                IntroScreen(),
                OnboardingScreenWidget(
                    image: 'assets/images/kabba.png',
                    label: 'Welcome To Islami',
                    info: 'We Are Very Excited To Have You In Our Community'),
                OnboardingScreenWidget(
                    image: 'assets/images/quran.png',
                    label: 'Reading the Quran',
                    info: 'Read, and your Lord is the Most Generous'),
                OnboardingScreenWidget(
                    image: 'assets/images/bearish.png',
                    label: 'Bearish',
                    info: 'Praise the name of your Lord, the Most High'),
                OnboardingScreenWidget(
                    image: 'assets/images/radio.png',
                    label: 'Holy Quran Radio',
                    info:
                        'You can listen to the Holy Quran Radio through the application for free and easily'),
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
                    currentIndex != 0 ? 'Back' : '',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 16),
                  ),
                ),
              ),
              Expanded(child: ProgressDots(currentIndex: currentIndex)),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex++;
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    });
                  },
                  child: Text(
                      textAlign: TextAlign.center,
                      currentIndex != 4 ? 'Next' : 'Finish',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontSize: 16)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
