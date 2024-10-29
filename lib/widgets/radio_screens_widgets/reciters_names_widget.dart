import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/reciter_model.dart';
import 'package:new_islamy/providers/radio_provider.dart';
import 'package:new_islamy/services/radio_service.dart';
import 'package:new_islamy/widgets/radio_screens_widgets/reciter_surah_list.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecitersNamesWidget extends StatelessWidget {
  const RecitersNamesWidget(
      {super.key,
      required this.reciterName,
      required this.reciterNumber,
      required this.sharedPreferences,
      required this.reciterIndex});
  final String reciterName;
  final int reciterNumber;
  final SharedPreferences sharedPreferences;
  final int reciterIndex;

  @override
  Widget build(BuildContext context) {
    RadioProvider radioProvider = Provider.of<RadioProvider>(context);
    return GestureDetector(
      onTap: () async {
        RadioService radioService = RadioService();
        List<ReciterModel> reciterModel =
            await radioService.getReciter(reciterNumber);
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => ReciterSurahList(
              reciterModel: reciterModel,
              reciterName: reciterName,
              radioProvider: radioProvider,
              sharedPreferences: sharedPreferences,
              reciterIndex: reciterIndex,
            ),
          ),
        );
      },
      child: Container(
        width: 390.w,
        height: 133.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
                child: Image.asset(
                  width: 390.w,
                  height: 97.h,
                  'assets/images/Mosque-02.png',
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  reciterName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 20.sp,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
