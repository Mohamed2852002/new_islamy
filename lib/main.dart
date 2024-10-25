import 'package:flutter/material.dart';
import 'package:new_islamy/new_islamy.dart';
import 'package:new_islamy/providers/language_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: const NewIslamy(),
    ),
  );
}
