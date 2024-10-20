import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildSebha extends StatefulWidget {
  const BuildSebha({super.key});

  @override
  State<BuildSebha> createState() => _BuildSebhaState();
}

class _BuildSebhaState extends State<BuildSebha> {
  final List<String> tasbeh = const [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
  ];

  int counter = 0;
  int cuurentIndex = 0;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          counter++;
          if (counter > 30) {
            cuurentIndex++;
            counter = 0;
          }
          if (cuurentIndex == 4) {
            cuurentIndex = 0;
          }
          angle += 2;
          setState(() {});
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0.h,
              left: 208.w,
              child: SizedBox(
                width: 73.w,
                height: 86.h,
                child: Image.asset('assets/images/Sebha head.png'),
              ),
            ),
            Positioned(
              bottom: 75.h,
              child: Transform.rotate(
                angle: angle,
                child: SizedBox(
                  width: 379.w,
                  height: 381.h,
                  child: Image.asset(
                    'assets/images/SebhaBody.png',
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 215.h,
              child: Column(
                children: [
                  Text(
                    tasbeh[cuurentIndex],
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 36.sp,
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    '$counter',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 36.sp,
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
