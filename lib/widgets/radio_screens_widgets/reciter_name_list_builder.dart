import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/widgets/radio_screens_widgets/reciters_names_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReciterNameListBuilder extends StatelessWidget {
  const ReciterNameListBuilder({
    super.key,
    required this.isLoading,
    required this.sharedPreferences,
  });
  final bool isLoading;
  final SharedPreferences sharedPreferences;
  final List<String> reciterNames = const [
    'عبد الباسط عبد الصمد',
    'عبد الرحمن السديس',
    'أبو بكر الشاطري',
    'هاني الرفاعي',
    'خليل الحصري',
    'مشاري العفاسي',
    'صديق المنشاوي',
    'سعود الشريم',
    'عبد المحسن القاسم',
    'سعد الغامدي',
  ];
  final List<int> recitersNumbers = const [
    1,
    3,
    4,
    5,
    6,
    7,
    8,
    10,
    11,
    13,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemCount: reciterNames.length,
      itemBuilder: (context, index) => RecitersNamesWidget(
        reciterName: reciterNames[index],
        reciterNumber: recitersNumbers[index],
        sharedPreferences: sharedPreferences,
        reciterIndex: index,
      ),
    );
  }
}
