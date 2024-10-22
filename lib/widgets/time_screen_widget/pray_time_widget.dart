import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayTimeWidget extends StatelessWidget {
  const PrayTimeWidget(
      {super.key, required this.prayName, required this.prayTime, this.time = 'PM'});
  final String prayName;
  final String prayTime;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105.w,
      height: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            prayName,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
          ),
          Text(
            prayTime,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.white,
                  fontSize: 32.sp,
                ),
          ),
          Text(
            time,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
          ),
        ],
      ),
    );
  }
}
