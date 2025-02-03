import 'package:flutter/material.dart';
import 'package:very_good_coffee/core/app/screen/main_screen.dart';
import 'package:very_good_coffee/core/theme/very_good_theme.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: VeryGoodTheme().defaultTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MainScreen(),
    );
  }
}
