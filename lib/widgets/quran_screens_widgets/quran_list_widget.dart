import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/sura_model.dart';
import 'package:new_islamy/screens/quran_screens/quran_details_screen.dart';

class QuranListWidget extends StatelessWidget {
  const QuranListWidget({
    super.key,
    required this.suraModel,
  });
  final SuraModel suraModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuranDetailsScreen(
              suraModel: suraModel,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 52.h,
                width: 52.w,
                child: Image.asset(
                  'assets/images/sura_number_container.png',
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                '${suraModel.surahNumber}',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          SizedBox(width: 24.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                suraModel.englishSuraName,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                '${suraModel.suraVerses} verses',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            suraModel.arabSuraName,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
          )
        ],
      ),
    );
  }
}
