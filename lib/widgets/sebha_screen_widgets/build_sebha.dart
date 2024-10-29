import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuildSebha extends StatefulWidget {
  const BuildSebha({super.key});

  @override
  State<BuildSebha> createState() => _BuildSebhaState();
}

class _BuildSebhaState extends State<BuildSebha>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final List<String> tasbeh = const [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
  ];

  int counter = 0;
  int currentIndex = 0;
  double angle = 0;
  late SharedPreferences sharedPreferences;
  initSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
    currentIndex = sharedPreferences.getInt('sebhaName') ?? 0;
    counter = sharedPreferences.getInt('sebhaCount') ?? 0;
    setState(() {});
  }

  @override
  void initState() {
    initSharedPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          counter++;
          if (counter > 33) {
            currentIndex++;
            counter = 0;
          }
          if (currentIndex == 4) {
            currentIndex = 0;
          }
          angle += 2;
          sharedPreferences.setInt('sebhaCount', counter);
          sharedPreferences.setInt('sebhaName', currentIndex);
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
                    tasbeh[currentIndex],
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
            Positioned(
              bottom: 20.r,
              right: 20.r,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  counter = 0;
                  currentIndex = 0;
                  sharedPreferences.setInt('sebhaCount', 0);
                  sharedPreferences.setInt('sebhaName', 0);
                  setState(() {});
                },
                child: Icon(
                  Icons.restart_alt_rounded,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
