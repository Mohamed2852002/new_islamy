import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/pray_time_model.dart';
import 'package:new_islamy/painters/left_painter.dart';
import 'package:new_islamy/painters/right_painter.dart';
import 'package:new_islamy/providers/time_provider.dart';
import 'package:new_islamy/services/pray_time_service.dart';
import 'package:new_islamy/widgets/time_screen_widget/pray_time_widget.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({super.key, required this.timeProvider});
  final TimeProvider timeProvider;

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool isLoading = true;
  late PrayTimeModel prayTimeModel;
  PrayTimeService prayTimeService = PrayTimeService();
  fetchPrayTime() async {
    prayTimeModel = await prayTimeService.getPrayTime();
    setState(() {
      isLoading = false;
    });
  }

  prayTimeCounter() async {
    await widget.timeProvider.initPrayTime();
    widget.timeProvider.startCountdown();
  }

  @override
  void initState() {
    super.initState();
    fetchPrayTime();
    prayTimeCounter();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
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
                      'Next Pray - ${widget.timeProvider.formatDuration(widget.timeProvider.duration)}',
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
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 30.w),
                            SizedBox(
                              width: 80.w,
                              height: 50.h,
                              child: Text(
                                prayTimeModel.gregorianDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 120.w,
                              height: 50.h,
                              child: Text(
                                '${prayTimeModel.hijriDateDay} ${prayTimeModel.hijriDateMonth} ${prayTimeModel.hijriDateYear}',
                                textAlign: TextAlign.right,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                        Expanded(
                          child: CarouselSlider(
                            items: [
                              PrayTimeWidget(
                                prayName: "Fajr",
                                prayTime: prayTimeModel.fajrTime,
                                time: 'AM',
                              ),
                              PrayTimeWidget(
                                  prayName: 'Dhuhr',
                                  prayTime: widget.timeProvider
                                      .setPrayerTime(prayTimeModel.dhuhrTime)),
                              PrayTimeWidget(
                                  prayName: 'Asr',
                                  prayTime: widget.timeProvider
                                      .setPrayerTime(prayTimeModel.asrTime)),
                              PrayTimeWidget(
                                  prayName: 'Maghrib',
                                  prayTime: widget.timeProvider.setPrayerTime(
                                      prayTimeModel.maghribTime)),
                              PrayTimeWidget(
                                  prayName: 'Isha',
                                  prayTime: widget.timeProvider
                                      .setPrayerTime(prayTimeModel.ishaTime)),
                            ],
                            options: CarouselOptions(
                              enlargeFactor: 0.2.h,
                              height: 130.h,
                              viewportFraction: 0.35.w,
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
      ),
    );
  }
}
