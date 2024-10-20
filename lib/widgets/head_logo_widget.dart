import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadLogoWidget extends StatelessWidget {
  const HeadLogoWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: 291.w,
            height: 171.h,
            child: Image.asset(
              'assets/images/Mosque-01.png',
            ),
          ),
          Text(
            'Islami',
            textHeightBehavior: const TextHeightBehavior(
                applyHeightToFirstAscent: false,
                applyHeightToLastDescent: false),
            style: TextStyle(
                fontSize: 80.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Kamali',
                color: Theme.of(context).colorScheme.primary),
          )
        ],
      ),
    );
  }
}
