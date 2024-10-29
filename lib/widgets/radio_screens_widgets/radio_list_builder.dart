import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/radio_model.dart';
import 'package:new_islamy/widgets/radio_screens_widgets/radio_info_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RadioListBuilder extends StatelessWidget {
  const RadioListBuilder({
    super.key,
    required this.radioModels,
    required this.isLoading,
    required this.sharedPreferences,
  });
  final List<RadioModel> radioModels;
  final bool isLoading;
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemCount: radioModels.length,
      itemBuilder: (context, index) => RadioInfoWidget(
        radioModel: radioModels[index],
        index: index,
        sharedPreferences: sharedPreferences,
      ),
    );
  }
}
