import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/widgets/time_screen_widget/time_widget.dart';
import 'package:new_islamy/widgets/time_screen_widget/zekr_widget.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TimeWidget(),
          SizedBox(height: 20.h),
          Text(
            'Azkar',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontSize: 16.sp),
          ),
          const ZekrWidget(),
        ],
      ),
    );
  }
}
