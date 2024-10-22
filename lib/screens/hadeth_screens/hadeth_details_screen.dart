import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/hadeth_model.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key, required this.hadethModel});
  final HadethModel hadethModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text('Hadeth ${hadethModel.hadethNumber}'),
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
              hadethModel.hadethName,
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        hadethModel.hadethContent.trim(),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(height: 2),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
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
