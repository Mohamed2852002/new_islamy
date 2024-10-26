import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/azkar_model.dart';
import 'package:new_islamy/providers/language_provider.dart';
import 'package:new_islamy/providers/time_provider.dart';
import 'package:new_islamy/screens/azkar_screens/azkar_details_screen.dart';
import 'package:provider/provider.dart';

class ZekrWidget extends StatelessWidget {
  const ZekrWidget({super.key, required this.azkarModel});
  final AzkarModel azkarModel;
  @override
  Widget build(BuildContext context) {
    TimeProvider timeProvider = Provider.of<TimeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return GestureDetector(
      onTap: () async {
        List<String> azkar =
            await timeProvider.getAzkar(azkarModel.zekrArabicName);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                AzkaDetailsScreen(azkarModel: azkarModel, azkar: azkar),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Theme.of(context).colorScheme.secondary,
          border: Border.all(
              width: 2.w, color: Theme.of(context).colorScheme.primary),
        ),
        height: 260.h,
        width: 185.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Image.asset(azkarModel.zekrImage),
            const Spacer(),
            Text(
              languageProvider.selectedLanguage == 'en'
                  ? azkarModel.zekrName
                  : azkarModel.zekrArabicName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
