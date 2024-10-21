import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/hadeth_model.dart';
import 'package:new_islamy/widgets/hadeth_screens_widgets/hadeth_content_widget.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  bool isLoading = true;
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
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Hadeth Name',
                    prefixIcon: ImageIcon(
                      AssetImage('assets/images/hadeth.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    viewportFraction: 0.73,
                    height: 565.h,
                    enlargeCenterPage: true,
                  ),
                  itemCount: hadeth.length,
                  itemBuilder: (context, index, page) => HadethContentWidget(
                    hadethModel: hadeth[index],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          );
  }

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
    isLoading = false;
    setState(() {});
  }
}
