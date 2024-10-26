import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/hadeth_model.dart';
import 'package:new_islamy/screens/hadeth_screens/hadeth_details_screen.dart';

class HadethContentWidget extends StatelessWidget {
  const HadethContentWidget({super.key, required this.hadethModel});
  final HadethModel hadethModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HadethDetailsScreen(hadethModel: hadethModel),
          ),
        );
      },
      child: Container(
        width: 313.w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 265.w,
              height: 376.h,
              child: Image.asset(
                'assets/images/quran.png',
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Positioned(
              top: 10.h,
              left: 10.w,
              child: SizedBox(
                width: 93.w,
                height: 92.h,
                child: Image.asset('assets/images/hadeth Cornerr l.png'),
              ),
            ),
            Positioned(
              top: 10.h,
              right: 10.w,
              child: SizedBox(
                width: 93.w,
                height: 92.h,
                child: Image.asset('assets/images/hadeth Cornerr r.png'),
              ),
            ),
            Positioned(
              top: 50.h,
              child: Text(
                hadethModel.hadethName,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.black),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 103.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Text(
                      hadethModel.hadethContent,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.black,
                            fontSize: 16.sp,
                            height: 2.h,
                          ),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 12,
                    ),
                  ),
                ),
                SizedBox(
                  width: 312.w,
                  height: 81.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),
                    ),
                    child: Image.asset(
                      'assets/images/Mosque-02.png',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
