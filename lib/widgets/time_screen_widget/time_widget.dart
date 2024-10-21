import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/painters/left_painter.dart';
import 'package:new_islamy/painters/right_painter.dart';
import 'package:new_islamy/widgets/time_screen_widget/pray_time_widget.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(40.r),
        ),
        width: 390.w,
        height: 300.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: 170.w,
                height: 75.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pray Time',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 20.sp,
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.71),
                          ),
                    ),
                    Text(
                      'Wednesday',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 20.sp,
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.90),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 390.w,
                height: 226.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(40.r),
                ),
              ),
            ),
            Positioned(
              top: 25.h,
              left: 53.w,
              child: CustomPaint(
                painter: LeftPainter(),
                child: SizedBox(
                  width: 60.w,
                  height: 50.h,
                ),
              ),
            ),
            Positioned(
              top: 25.h,
              right: 53.w,
              child: CustomPaint(
                painter: RightPainter(),
                child: SizedBox(
                  width: 60.w,
                  height: 50.h,
                ),
              ),
            ),
            Positioned(
              bottom: 16.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Next Pray - 2038',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 16.sp,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  // SizedBox(width: 200.w),
                  Icon(
                    Icons.volume_down_rounded,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 30.w),
                    SizedBox(
                      width: 50.w,
                      height: 50.h,
                      child: Text(
                        '16 jul,2022',
                        style:
                            Theme.of(context).textTheme.labelSmall!.copyWith(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 61.w,
                      height: 50.h,
                      child: Text(
                        '09 Muh,1446',
                        textAlign: TextAlign.right,
                        style:
                            Theme.of(context).textTheme.labelSmall!.copyWith(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    SizedBox(width: 30.w),
                  ],
                ),
                Expanded(
                  child: CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) =>
                        const PrayTimeWidget(),
                    options: CarouselOptions(
                      enlargeFactor: 0.2,
                      height: 130.h,
                      viewportFraction: 0.3,
                      enlargeCenterPage: true,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
