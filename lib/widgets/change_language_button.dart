import 'package:flutter/material.dart';
import 'package:new_islamy/providers/language_provider.dart';
import 'package:provider/provider.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: const CircleBorder()),
      onPressed: () {
        languageProvider.changeLanguage();
      },
      child: Text(
        textAlign: TextAlign.center,
        languageProvider.selectedLanguage == 'en' ? 'en' : 'ar',
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
