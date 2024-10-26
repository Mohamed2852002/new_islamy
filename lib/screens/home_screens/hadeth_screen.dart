import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/hadeth_model.dart';
import 'package:new_islamy/widgets/hadeth_screens_widgets/hadeth_content_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethModel> hadeth = [];
  loadHadeth() async {
    String fileContent =
        await rootBundle.loadString('assets/text_files/ahadeth.txt');
    List<String> ahadeth = fileContent.split('#');
    for (var i = 0; i < ahadeth.length; i++) {
      List<String> hadethLines = ahadeth[i].trim().split('\n');
      String hadethName = hadethLines[0];
      hadethLines.removeAt(0);
      String hadethContent = hadethLines.join(' ');
      hadeth.add(
        HadethModel(
            hadethContent: hadethContent,
            hadethName: hadethName,
            hadethNumber: i + 1),
      );
    }
    foundHadeth = hadeth;
    isLoading = false;
    setState(() {});
  }

  bool isLoading = true;

  List<HadethModel> foundHadeth = [];
  filterHadeth(String enteredKeys) {
    List<HadethModel> reslts = [];
    if (enteredKeys.isEmpty) {
      reslts = hadeth;
    } else {
      reslts = hadeth
          .where((hadeth) => hadeth.hadethName.contains(enteredKeys))
          .toList();
    }
    setState(() {
      foundHadeth = reslts;
    });
  }

  @override
  void initState() {
    super.initState();
    loadHadeth();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TextField(
                  onChanged: (value) {
                    filterHadeth(value);
                  },
                  decoration: InputDecoration(
                    hintText:
                        AppLocalizations.of(context)!.hadeth_name_text_field,
                    prefixIcon: const ImageIcon(
                      AssetImage('assets/images/hadeth.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    viewportFraction: 0.87.w,
                    height: 565.h,
                    enlargeCenterPage: true,
                  ),
                  itemCount: foundHadeth.isNotEmpty ? foundHadeth.length : 0,
                  itemBuilder: (context, index, page) => foundHadeth.isEmpty
                      ? Center(
                          child: Text(
                            'Non Found',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        )
                      : HadethContentWidget(
                          hadethModel: foundHadeth[index],
                        ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          );
  }
}
