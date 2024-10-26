import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/screens/onboarding_screens.dart';

class AfterSplashScreen extends StatelessWidget {
  const AfterSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreens(),
          ),
        );
      },
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              right: 15.w,
              child: SizedBox(
                  width: 85.w,
                  height: 310.h,
                  child: Image.asset('assets/images/Glow.png')),
            ),
            Positioned(
              top: 215.h,
              child: SizedBox(
                  width: 90.w,
                  height: 190.h,
                  child: Image.asset('assets/images/Shape-07.png')),
            ),
            Positioned(
              top: 605.h,
              right: 0,
              child: SizedBox(
                  width: 90.w,
                  height: 190.h,
                  child: Image.asset('assets/images/Shape-04.png')),
            ),
            Column(
              children: [
                SafeArea(
                  child: Center(
                    child: SizedBox(
                      width: 291.w,
                      height: 171.h,
                      child: Image.asset(
                        'assets/images/Mosque-01.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 160.h),
                SizedBox(
                  width: 170.w,
                  height: 155.h,
                  child: Image.asset('assets/images/OBJECTS.png'),
                ),
                Text(
                  'Islami',
                  textHeightBehavior: const TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: false),
                  style: TextStyle(
                      fontSize: 64.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Kamali',
                      color: Theme.of(context).colorScheme.primary),
                ),
                const Spacer(),
                SizedBox(
                  width: 180.w,
                  height: 75.h,
                  child: Image.asset('assets/images/routegold.png'),
                ),
                Text(
                  'Supervised by Mohamed Nabil',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                SizedBox(height: 80.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
