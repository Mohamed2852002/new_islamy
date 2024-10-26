import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/providers/time_provider.dart';
import 'package:new_islamy/screens/home_screens/hadeth_screen.dart';
import 'package:new_islamy/screens/home_screens/quran_screen.dart';
import 'package:new_islamy/screens/home_screens/radio_screen.dart';
import 'package:new_islamy/screens/home_screens/sebha_screen.dart';
import 'package:new_islamy/screens/home_screens/time_screen.dart';
import 'package:new_islamy/widgets/change_language_button.dart';
import 'package:new_islamy/widgets/head_logo_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppHomeNavigation extends StatefulWidget {
  const AppHomeNavigation({super.key});

  @override
  State<AppHomeNavigation> createState() => _AppHomeNavigationState();
}

class _AppHomeNavigationState extends State<AppHomeNavigation> {
  int currentIndex = 0;
  PageController pageController = PageController();
  List<String> images = [
    'assets/images/taj-mahal-agra-india.png',
    'assets/images/vertical-shot-hassan-ii-mosque-casablanca-morocco.png',
    'assets/images/close-up-islamic-new-year-with-quran-books.png',
    'assets/images/silhouette-woman-reading-quran.png',
    'assets/images/taj-mahal-agra-india 1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeProvider(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), // Adjust the opacity
              BlendMode.dstATop, // Blend mode to apply the color filter
            ),
            fit: BoxFit.cover,
            image: AssetImage(images[currentIndex]),
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          bottomNavigationBar: NavigationBar(
            selectedIndex: currentIndex,
            onDestinationSelected: (value) {
              currentIndex = value;
              pageController.animateToPage(value,
                  duration: const Duration(microseconds: 100),
                  curve: Curves.linear);
              setState(() {});
            },
            destinations: [
              NavigationDestination(
                  icon: const ImageIcon(
                    AssetImage('assets/images/quran_tab.png'),
                  ),
                  label: AppLocalizations.of(context)!.quran_tab_page),
              NavigationDestination(
                  icon: const ImageIcon(
                    AssetImage('assets/images/hadeth.png'),
                  ),
                  label: AppLocalizations.of(context)!.hadeth_tab_page),
              NavigationDestination(
                  icon: const ImageIcon(
                    AssetImage('assets/images/sebha.png'),
                  ),
                  label: AppLocalizations.of(context)!.sebha_tab_page),
              NavigationDestination(
                  icon: const ImageIcon(
                    AssetImage('assets/images/radio_tab.png'),
                  ),
                  label: AppLocalizations.of(context)!.radio_tab_page),
              NavigationDestination(
                  icon: const ImageIcon(
                    AssetImage('assets/images/time.png'),
                  ),
                  label: AppLocalizations.of(context)!.time_tab_page),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const HeadLogoWidget(),
                    Positioned(
                        right: 25.w,
                        top: 60.h,
                        child: const ChangeLanguageButton()),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    currentIndex = value;
                    setState(() {});
                  },
                  children: const [
                    QuranScreen(),
                    HadethScreen(),
                    SebhaScreen(),
                    RadioScreen(),
                    TimeScreen(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
