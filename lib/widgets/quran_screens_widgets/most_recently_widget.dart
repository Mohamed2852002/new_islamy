import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostRecentlyWidget extends StatelessWidget {
  const MostRecentlyWidget({super.key, required this.arabSuraName, required this.englishSuraName, required this.suraVerses});
  final String arabSuraName;
  final String englishSuraName;
  final String suraVerses;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 280.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                englishSuraName,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20.sp,
                    ),
              ),
              Text(
                arabSuraName,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20.sp,
                    ),
              ),
              Text(
                suraVerses,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 14.sp,
                    ),
              ),
            ],
          ),
          SizedBox(
            width: 150.w,
            height: 135.h,
            child: Image.asset(
              'assets/images/reading.png',
            ),
          ),
        ],
      ),
    );
  }
}
