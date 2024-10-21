import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/radio_model.dart';
import 'package:new_islamy/providers/radio_provider.dart';
import 'package:new_islamy/services/radio_service.dart';
import 'package:new_islamy/widgets/radi_screens_widgets/radio_info_widget.dart';
import 'package:provider/provider.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen>
    with AutomaticKeepAliveClientMixin {
  bool onRadioScreen = true;
  bool isLoading = true;
  RadioService radioService = RadioService();
  List<RadioModel> radioModels = [];
  List<RadioModel> recitersModels = [];
  fetchRadio() async {
    radioModels = await radioService.getRadio();
    recitersModels = await radioService.getReciter();
    isLoading = false;
    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    fetchRadio();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : ChangeNotifierProvider(
            create: (context) => RadioProvider(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              onRadioScreen = true;
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
                                  'Radio',
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
                                  'Reciters',
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
                  SizedBox(height: 18.h),
                  onRadioScreen
                      ? Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 16.h),
                            itemCount: radioModels.length,
                            itemBuilder: (context, index) =>
                                RadioInfoWidget(radioModel: radioModels[index]),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 16.h),
                            itemCount: recitersModels.length,
                            itemBuilder: (context, index) => RadioInfoWidget(
                                radioModel: recitersModels[index]),
                          ),
                        ),
                ],
              ),
            ),
          );
  }
}
