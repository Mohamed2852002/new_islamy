import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool isEnglish = true;

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
            'Chose Language',
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      isEnglish = true;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          ),
                          color: isEnglish == true
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent),
                      child: Image.asset('assets/images/US.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      isEnglish = false;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: isEnglish == false
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent),
                      child: Image.asset('assets/images/YE.png'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
