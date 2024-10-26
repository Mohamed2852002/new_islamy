import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/providers/language_provider.dart';
import 'package:provider/provider.dart';

class LanguageSelectorWidget extends StatelessWidget {
  const LanguageSelectorWidget({super.key});
  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                languageProvider.changeLanguage();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                    color: languageProvider.isEnglish == true
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent),
                child: Image.asset('assets/images/US.png'),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                languageProvider.changeLanguage();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    color: languageProvider.isEnglish == false
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent),
                child: Image.asset('assets/images/YE.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
