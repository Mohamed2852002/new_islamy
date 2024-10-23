import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/sura_model.dart';
import 'package:new_islamy/widgets/quran_screens_widgets/sura_line_widget.dart';

class QuranDetailsScreen extends StatefulWidget {
  const QuranDetailsScreen({super.key, required this.suraModel});
  final SuraModel suraModel;
  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    loadSura(widget.suraModel.surahNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(widget.suraModel.englishSuraName),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 93.w,
                    height: 92.h,
                    child: Image.asset('assets/images/Mask left.png')),
                Text(
                  widget.suraModel.arabSuraName,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(
                    width: 93.w,
                    height: 92.h,
                    child: Image.asset('assets/images/Mask right.png')),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          isLoading
              ? const Expanded(
                  child: Center(child: CircularProgressIndicator()))
              : Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 8.h),
                    itemCount: suraLines.length,
                    itemBuilder: (context, index) {
                      return SuraLineWidget(
                        suraLine: suraLines[index].trim(),
                        index: index + 1,
                      );
                    },
                  ),
                ),
          Image.asset('assets/images/Mosque-02.png'),
        ],
      ),
    );
  }

  List<String> suraLines = [];

  loadSura(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/text_files/$index.txt');
    suraLines = fileContent.trim().split('\n');
    isLoading = false;
    setState(() {});
  }
}
