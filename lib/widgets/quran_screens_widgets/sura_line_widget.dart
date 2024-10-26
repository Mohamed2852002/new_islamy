import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuraLineWidget extends StatelessWidget {
  const SuraLineWidget(
      {super.key, required this.suraLine, required this.index});
  final String suraLine;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 16.w),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Text(
        '$suraLine [$index]',
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 20.sp,
              height: 2.h,
            ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
