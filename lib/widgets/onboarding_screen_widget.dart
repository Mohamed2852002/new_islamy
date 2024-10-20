import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreenWidget extends StatelessWidget {
  const OnboardingScreenWidget({
    super.key,
    required this.image,
    required this.label,
    required this.info,
    required this.imageWidth,
  });
  final String image;
  final String label;
  final String info;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          SizedBox(
            width: imageWidth.w,
            height: 400.h,
            child: Image.asset(image),
          ),
          SizedBox(height: 30.h),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: 26.h),
          Text(
            info,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontSize: 20.sp),
          ),
        ],
      ),
    );
  }
}
