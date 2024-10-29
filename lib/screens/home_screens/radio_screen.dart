import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/radio_model.dart';
import 'package:new_islamy/providers/radio_provider.dart';
import 'package:new_islamy/services/radio_service.dart';
import 'package:new_islamy/widgets/radio_screens_widgets/radio_list_builder.dart';
import 'package:new_islamy/widgets/radio_screens_widgets/reciter_name_list_builder.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen>
    with AutomaticKeepAliveClientMixin {
  PageController pageController = PageController();
  bool onRadioScreen = true;
  RadioService radioService = RadioService();
  List<RadioModel> radioModels = [];
  bool isLoading = true;
  late SharedPreferences sharedPreferences;
  fetchRadio() async {
    sharedPreferences = await SharedPreferences.getInstance();
    radioModels = await radioService.getRadio();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    fetchRadio();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ChangeNotifierProvider(
      create: (context) => RadioProvider(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  SizedBox(height: 18.h),
                  Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.7),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                onRadioScreen = true;
                                pageController.previousPage(
                                    duration: const Duration(microseconds: 800),
                                    curve: Curves.linear);
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: onRadioScreen
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.radio_tab,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: onRadioScreen
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 16.sp,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                onRadioScreen = false;
                                pageController.nextPage(
                                    duration: const Duration(microseconds: 800),
                                    curve: Curves.linear);
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: onRadioScreen
                                      ? Colors.transparent
                                      : Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.reciters_tab,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: onRadioScreen
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      children: [
                        RadioListBuilder(
                          radioModels: radioModels,
                          isLoading: isLoading,
                          sharedPreferences: sharedPreferences,
                        ),
                        ReciterNameListBuilder(
                          isLoading: isLoading,
                          sharedPreferences: sharedPreferences,
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
