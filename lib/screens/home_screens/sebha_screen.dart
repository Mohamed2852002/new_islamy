import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/widgets/sebha_screen_widgets/build_sebha.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 18.h),
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 36.sp,
                color: Colors.white,
              ),
        ),
        SizedBox(height: 32.h),
        const Expanded(
          child: BuildSebha(),
        ),
      ],
    );
  }
}
