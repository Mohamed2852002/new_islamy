import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/azkar_model.dart';

class AzkaDetailsScreen extends StatelessWidget {
  const AzkaDetailsScreen(
      {super.key, required this.azkarModel, required this.azkar});
  final AzkarModel azkarModel;
  final List<String> azkar;
  @override
  Widget build(BuildContext context) {
    List<String> azkarTimes = [];
    List<String> azkarContent = [];
    for (var i = 0; i < azkar.length; i += 2) {
      azkarTimes.add(azkar[i]);
      azkarContent.add(azkar[i + 1]);
    }
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 20.w,
            top: 0,
            child: SizedBox(
                width: 93.w,
                height: 92.h,
                child: Image.asset('assets/images/Mask left.png')),
          ),
          Positioned(
            top: 35.h,
            child: Text(
              azkarModel.zekrName,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Positioned(
            right: 20.w,
            top: 0,
            child: SizedBox(
                width: 93.w,
                height: 92.h,
                child: Image.asset('assets/images/Mask right.png')),
          ),
          Column(
            children: [
              SizedBox(height: 110.h),
              Expanded(
                child: ListView(
                  children: [
                    ...List.generate(
                      azkarContent.length,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                azkarTimes[index] == '1'
                                    ? 'مرة'
                                    : '${azkarTimes[index]} مرات',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(height: 2),
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                              ),
                              Text(
                                azkarContent[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(height: 2),
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                              ),
                              Divider(
                                  endIndent: 0,
                                  indent: 0,
                                  color: Theme.of(context).colorScheme.primary),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Image.asset('assets/images/Mosque-02.png'),
            ],
          ),
        ],
      ),
    );
  }
}
