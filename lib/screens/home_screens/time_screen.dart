import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/azkar_model.dart';
import 'package:new_islamy/providers/time_provider.dart';
import 'package:new_islamy/widgets/time_screen_widget/time_widget.dart';
import 'package:new_islamy/widgets/time_screen_widget/zekr_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});
  final List<AzkarModel> models = const [
    AzkarModel(
        zekrImage: 'assets/images/sabah.png',
        zekrName: 'Morning Azkar',
        zekrArabicName: 'أذكار الصباح'),
    AzkarModel(
        zekrImage: 'assets/images/masaa.png',
        zekrName: 'Evening Azkar',
        zekrArabicName: 'أذكار المساء'),
    AzkarModel(
        zekrImage: 'assets/images/salah.png',
        zekrName: 'Pray Azkar',
        zekrArabicName: 'أذكار بعد الصلاة'),
    AzkarModel(
        zekrImage: 'assets/images/prophets.png',
        zekrName: 'Prohpets Azkar',
        zekrArabicName: 'أدعية الأنبياء'),
    AzkarModel(
        zekrImage: 'assets/images/wake up.png',
        zekrName: 'Waking Up Azkar',
        zekrArabicName: 'أذكار الاستيقاظ'),
    AzkarModel(
        zekrImage: 'assets/images/sleep.png',
        zekrName: 'Sleeping Azkar',
        zekrArabicName: 'أذكار النوم'),
  ];
  @override
  Widget build(BuildContext context) {
    TimeProvider timeProvider = Provider.of<TimeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 16.h),
          ),
          SliverToBoxAdapter(
            child: TimeWidget(timeProvider: timeProvider),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 16.h),
          ),
          SliverToBoxAdapter(
            child: Text(
              AppLocalizations.of(context)!.azkar_list,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 16.sp),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 16.h),
          ),
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 16.h,
              mainAxisExtent: 260.h,
            ),
            itemCount: models.length,
            itemBuilder: (context, index) =>
                ZekrWidget(azkarModel: models[index]),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 16.h),
          ),
        ],
      ),
    );
  }
}
